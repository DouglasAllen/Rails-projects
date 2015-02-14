class CreateArticles < ActiveRecord::Migration
  def up

    create_table "articles", force: :cascade do |t|
      t.string   "title"
      t.text     "text"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "comments", force: :cascade do |t|
      t.string   "commenter"
      t.text     "body"
      t.integer  "post_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    add_index "comments", ["post_id"], name: "index_comments_on_post_id"

    create_table "posts", force: :cascade do |t|
      t.string   "name"
      t.string   "title"
      t.text     "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end 
  end
end
