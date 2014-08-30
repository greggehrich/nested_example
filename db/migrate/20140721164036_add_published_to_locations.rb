class AddPublishedToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :published, :boolean, default: true
  end
end
