require_relative 'helper'

module GameStats

  # Determines if we auto populate stats for similar games when adding a new game (default = true)
  mattr_accessor :auto_populate_similar_games

  # Determines if we also add an entry for homepage with every new game as similar game, for homepage stats (default = false)
  mattr_accessor :add_homepage_stats_as_game_zero

  # Name of the Game class to use (defaults to 'Game')
  mattr_accessor :game_class_name

  class Engine < ::Rails::Engine
    isolate_namespace GameStats

    initializer "game_stats" do |app|

      GameStats::game_class_name ||= 'Game'
      GameStats::auto_populate_similar_games = true if GameStats::auto_populate_similar_games.nil?
      GameStats::add_homepage_stats_as_game_zero = false if GameStats::auto_populate_similar_games.nil?

      # Mix-in our helper methods to the controllers of the application
      ActionController::Base.send :include, GameStats::Helper

      # Mix-in our game helper methods to the Game class of the application
      GameStats::game_class_name.constantize.send :include, GameCallbacks
    end

  end
end
