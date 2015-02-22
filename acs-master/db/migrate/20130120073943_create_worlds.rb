class CreateWorlds < ActiveRecord::Migration
  def change
    create_table :worlds do |t|
      t.text :description
      t.string :author_name, :length => 60
      t.string :author_email, :length => 300
      t.string :name, :length => 60

      t.timestamps
    end
  end
end
