class RenameCampfireAccountToCampfireSubdomain < ActiveRecord::Migration
  def change
    rename_column :people, :campfire_account, :campfire_subdomain
  end
end
