class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :name

      t.timestamps
    end
    add_index :manufacturers, :name
  end
end
