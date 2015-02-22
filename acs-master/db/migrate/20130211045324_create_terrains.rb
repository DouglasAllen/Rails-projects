class CreateTerrains < ActiveRecord::Migration
  def change
    create_table :terrains do |t|
      t.string :name
      t.integer :game_image_id
      t.integer :passibility
      t.integer :terrain_set_id

      t.timestamps
    end
  end
end
