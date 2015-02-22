class DropRoomTypeAndState < ActiveRecord::Migration
  def change
    drop_table :room_types
    drop_table :room_states
  end
end
