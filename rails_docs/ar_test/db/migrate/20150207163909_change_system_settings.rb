class ChangeSystemSettings < ActiveRecord::Migration
  def up  
    def change
      create_table :system_settings do |t|
      end
    end
  end

  def down
    def change
      drop_table :system_settings do |t|
      end
    end
  end
end
