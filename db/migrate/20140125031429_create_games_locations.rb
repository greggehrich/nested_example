class CreateGamesLocations < ActiveRecord::Migration
  def change
    create_table :games_locations do |t|
      t.integer :game_id
      t.integer :location_id
    end
  end
end
