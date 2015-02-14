class CreateWidgets < ActiveRecord::Migration
  def create
    create_table :widgets do |t|
      t.string   :name
      t.text     :description
      t.integer  :stock

      t.timestamps
    end
  end
end
