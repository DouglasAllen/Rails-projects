class CreateCrustTypes < ActiveRecord::Migration
  def self.up
    create_table :crust_types do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :crust_types
  end
end
