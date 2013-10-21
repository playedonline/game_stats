require_dependency "game_stats/application_controller"

module GameStats
  class GameStatController < ApplicationController

    def record_impressions
      if params[:similar_games_ids].present? && params[:game_id].present?
        GameStat.record_impressions params[:game_id], params[:similar_games_ids].split(',')
      end
      render :nothing => true
    end

  end
end
