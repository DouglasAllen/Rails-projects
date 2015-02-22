class CreateRoomTypes < ActiveRecord::Migration
  def change
    create_table :room_types do |t|
      t.string :name, :length => 60
      t.text :json_data

      t.timestamps
    end
  end
end
