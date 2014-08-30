class DeleteIdFromGamesLocationsAndAddIndex < ActiveRecord::Migration
  def change
    remove_column :games_locations, :id
    add_index :games_locations, [:game_id, :location_id], :unique => true
    add_index :games_locations, [:location_id, :game_id], :unique => true
  end
end
