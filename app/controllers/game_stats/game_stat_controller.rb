require_dependency "game_stats/application_controller"

module GameStats
  class GameStatController < ApplicationController

    # TODO: Remove
    def show
    end

    def record_impressions
      GameStat.record_impressions params[:game_id], params[:similar_games_ids]
      render :nothing => true
    end

  end
end
