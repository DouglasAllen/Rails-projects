class CreateServerStatuses < ActiveRecord::Migration
  def change
    create_table :server_statuses do |t|
      t.integer :world_id
      t.string  :server_host

      t.timestamps
    end
  end
end
