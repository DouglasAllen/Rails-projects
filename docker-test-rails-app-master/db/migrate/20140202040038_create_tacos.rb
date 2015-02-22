class CreateTacos < ActiveRecord::Migration
  def change
    create_table :tacos do |t|
      t.string :flavor
      t.string :vendor
      t.integer :rating

      t.timestamps
    end
  end
end
