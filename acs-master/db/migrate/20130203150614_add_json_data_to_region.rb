class AddJsonDataToRegion < ActiveRecord::Migration
  def change
    add_column :regions, :json_data, :string
  end
end
