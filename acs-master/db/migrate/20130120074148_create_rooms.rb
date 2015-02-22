class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name, :length => 60
      t.integer :room_type_id
      t.integer :region_id
      t.text :json_data

      t.timestamps
    end
  end
end
