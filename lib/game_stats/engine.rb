require_relative 'helper'

module GameStats

  # Determines if we auto populate stats for similar games when adding a new game
  mattr_accessor :auto_populate_similar_games

  class Engine < ::Rails::Engine
    isolate_namespace GameStats

    # Mixin our helper methods to the controllers of the application
    initializer "game_stats" do |app|
      ActionController::Base.send :include, GameStats::Helper
    end

  end
end
