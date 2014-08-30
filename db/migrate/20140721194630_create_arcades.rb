class CreateArcades < ActiveRecord::Migration

  def up

    create_table :arcades, :id => false do |t|
      t.references :game, index: true
      t.references :location, index: true
      t.string :comment
    end

    add_index :arcades, [:game_id, :location_id]
    add_index :arcades, [:location_id, :game_id]

    execute 'INSERT INTO arcades (game_id, location_id) SELECT game_id, location_id FROM games_locations'

  end

  def down
    drop_table :arcades
  end

end
