class CreatePosts < ActiveRecord::Migration
  def create
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
