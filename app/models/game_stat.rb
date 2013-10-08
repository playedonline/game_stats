class GameStat

  attr_accessor :impressions, :clicks, :context_id
  #belongs_to :game
  #belongs_to :similar_game, :class_name => "Game"

  # TODO: see how i can add this to after create of game from the engine
  def self.on_new_game_added(game_id)
    # if auto_populate -
      # add the game to all the other games
      # add a record for the new game with all the other games (see game->init_similar_games in oopla)

    # TODO: when adding a new game we also need to add it to the homepage (id=0), or we can use find_or_create? another option is to add a configuration an option for it (add_new_games_homepage_stats)

  end

  # see fetch_similar_game_stats in oopla
  def self.get_similar_games(game_id, amount)
  end

  def self.record_click(game_id, similar_game_id)
    #TODO: Change to a specific method?
    increment_stats_for_game(game_id, :clicks, [similar_game_id])
  end

  def self.record_impressions(game_id, similar_game_ids)
    increment_stats_for_game(game_id, :impressions, similar_game_ids)
  end

  private

  # stat_name = :impressions / clicks
  def self.increment_stats_for_game(game_id, stat_name, similar_game_ids)

  end

  # will be used for manual similar games
  #def add_similar_games(game_id, similar_game_ids)
  #end


  # will be used for homepage order
  #def self.get_games_order
  #end
end