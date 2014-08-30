class AddTelephoneToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :telephone, :string, limit: 10
  end
end
