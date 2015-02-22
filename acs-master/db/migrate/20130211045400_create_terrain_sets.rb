class CreateTerrainSets < ActiveRecord::Migration
  def change
    create_table :terrain_sets do |t|
      t.string :name

      t.timestamps
    end
  end
end
