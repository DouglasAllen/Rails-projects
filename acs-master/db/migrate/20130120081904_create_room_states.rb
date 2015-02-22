class CreateRoomStates < ActiveRecord::Migration
  def change
    create_table :room_states do |t|
      t.text :json_data

      t.timestamps
    end
  end
end
