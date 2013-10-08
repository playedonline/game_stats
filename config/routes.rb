GameStats::Engine.routes.draw do
  #get "game_stat/show"
  root :to => "game_stat#show"
  post "/record_impressions" => "game_stat#record_impressions"
end
