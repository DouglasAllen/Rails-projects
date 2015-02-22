class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :person_id
      t.string :text

      t.timestamps
    end
  end
end
