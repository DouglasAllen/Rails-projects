class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :token

      t.string :campfire_account
      t.string :campfire_token
      t.string :campfire_room

      t.timestamps
    end
  end
end
