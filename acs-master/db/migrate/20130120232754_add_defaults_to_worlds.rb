class AddDefaultsToWorlds < ActiveRecord::Migration
  def change
    add_column :worlds, :is_default, :boolean
  end
end
