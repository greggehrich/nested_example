class AddCategoryRefToLocations < ActiveRecord::Migration
  def change
    add_reference :locations, :category, index: true
  end
end
