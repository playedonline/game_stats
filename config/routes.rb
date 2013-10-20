GameStats::Engine.routes.draw do
  post "/record_impressions" => "game_stat#record_impressions"
end
