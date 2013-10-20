require_dependency "game_stats/application_controller"

module GameStats
  class GameStatController < ApplicationController

    def record_impressions
      GameStat.record_impressions params[:game_id], params[:similar_games_ids].split(',')
      render :nothing => true
    end

  end
end
