module GameStats

  # Methods to be used from application's controllers
  module Helper

    def collect_click_data
      if cookies["click_data"].present?
        click_data = cookies['click_data'].split('|')
        cookies.delete 'click_data'
        game_id = click_data[0]
        similar_game_id = click_data[1]
        GameStat.record_click game_id, similar_game_id
      end

    end
  end
end