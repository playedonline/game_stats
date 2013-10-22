class GameStat < ActiveRecord::Base

  attr_accessible :impressions, :clicks, :game_id, :similar_game_id
  belongs_to :game, :class_name => GameStats::game_class_name
  belongs_to :similar_game, :class_name => GameStats::game_class_name

  def self.on_game_deleted(deleted_game_id)
    GameStat.where("similar_game_id = #{deleted_game_id} OR game_id = #{deleted_game_id}").delete_all
  end

  def self.on_new_game_added(new_game_id)
    if GameStats::auto_populate_similar_games

      # Add a record for each game with the new game as similar
      GameStat.connection.execute(
          "INSERT INTO game_stats(game_id, similar_game_id, impressions, clicks)
          SELECT games.id, #{new_game_id}, 2, 2
          FROM games
          WHERE games.id <> #{new_game_id}")

      # Add a record for the new game with all the other games as similar games
      GameStat.connection.execute(
          "INSERT INTO game_stats(game_id, similar_game_id, impressions, clicks)
          SELECT #{new_game_id}, games.id, 2, 2
          FROM games
          WHERE games.id <> #{new_game_id}")
    end

    if GameStats::add_homepage_stats_as_game_zero
       GameStat.create(:game_id => 0, :similar_game_id => new_game_id, :impressions => 0, :clicks => 0)
    end

  end

  def self.get_similar_games(game_id, amount, games_cache_key)
    Rails.cache.fetch(['similar_games', game_id, amount, games_cache_key],:expires_in => (GameStats::minutes_to_expire_similar_games_cache).minutes) do
      GameStat.includes(:similar_game).joins(:similar_game).where({:game_id => game_id, :games => {:visible => true}}).order('clicks / impressions DESC').limit(amount).map do |game_stat|
        game_stat.similar_game
      end
    end
  end

  def self.record_click(game_id, similar_game_id)
    GameStat.where({:game_id => game_id, :similar_game_id => similar_game_id}).update_all("clicks = clicks + 1")
  end

  def self.record_impressions(game_id, similar_game_ids)
    GameStat.where({:game_id => game_id, :similar_game_id => similar_game_ids}).update_all("impressions = impressions + 1")
  end

  def ctr
    if self.impressions == 0
      0
    else
      (100 * self.clicks / self.impressions).round(2)
    end
  end

  # manual similar games
  #def self.add_similar_games(game_id, similar_game_ids)
  #end

  # homepage order
  #def self.get_games_order
  #end

end