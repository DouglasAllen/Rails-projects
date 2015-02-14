class CreatePizzaToppings < ActiveRecord::Migration
  def self.up
    create_table :pizza_toppings do |t|
      t.integer :pizza_id
      t.integer :topping_id
      t.timestamps
    end
    add_index :pizza_toppings, :pizza_id
    add_index :pizza_toppings, :topping_id
  end
  
  def self.down
    drop_table :pizza_toppings
  end
end
