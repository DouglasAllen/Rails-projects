class AddCrustToPizzas < ActiveRecord::Migration
  def self.up
    add_column :pizzas, :crust_type_id, :integer
    add_index :pizzas, :crust_type_id
  end

  def self.down
    remove_index :pizzas, :crust_type_id
    remove_column :pizzas, :crust_type_id
  end
end
