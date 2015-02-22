class AddStartRoomToWorlds < ActiveRecord::Migration
  def change
    add_column :worlds, :start_room_id, :integer
  end
end
