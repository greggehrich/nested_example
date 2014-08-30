class AddHasMenuToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :has_menu, :boolean, :default => false
  end
end
