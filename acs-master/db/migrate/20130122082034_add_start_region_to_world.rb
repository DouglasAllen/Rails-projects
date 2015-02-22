class AddStartRegionToWorld < ActiveRecord::Migration
  def change
    add_column :worlds, :start_region_id, :integer
  end
end
