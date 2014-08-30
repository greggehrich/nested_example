class CreateFactoids < ActiveRecord::Migration
  def change
    create_table :factoids do |t|
      t.string :body

      t.timestamps
    end
  end
end
