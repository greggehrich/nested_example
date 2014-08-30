class AddReleaseDateAndManufacturerIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :release_date, :integer
    add_reference :games, :manufacturer, index: true
  end
end
