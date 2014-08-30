class AddLocationsCountToStates < ActiveRecord::Migration
  def change
    add_column :states, :locations_count, :integer
  end
end
