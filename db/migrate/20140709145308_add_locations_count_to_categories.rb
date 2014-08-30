class AddLocationsCountToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :locations_count, :integer
  end
end
