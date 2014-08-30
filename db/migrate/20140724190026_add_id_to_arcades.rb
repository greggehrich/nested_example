class AddIdToArcades < ActiveRecord::Migration
  def change
    add_column :arcades, :id, :primary_key, :first => true
  end
end
