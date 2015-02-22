class CreateGameImages < ActiveRecord::Migration
  def change
    create_table :game_images do |t|
      t.string :image_data

      t.timestamps
    end
  end
end
