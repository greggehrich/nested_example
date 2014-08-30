class AddStateIdToLocations < ActiveRecord::Migration
  def change
    add_reference :locations, :state, index: true
  end
end
