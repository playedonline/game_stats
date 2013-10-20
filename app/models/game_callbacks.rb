module GameCallbacks

  extend ActiveSupport::Concern

  included do
    after_create :handle_game_created
    after_destroy :handle_game_deleted
  end

  def handle_game_created
    GameStat.on_new_game_added self.id
  end

  def handle_game_deleted
    GameStat.on_game_deleted self.id
  end

end
