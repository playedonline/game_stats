class CreateGameStats < ActiveRecord::Migration
  def change
    create_table :game_stats do |t|
      t.integer :game_id, :null => false
      t.integer :similar_game_id, :null => false
      t.integer :impressions, :null => false,  :default => 0
      t.integer :clicks, :null => false, :default => 0
    end
  end
end
