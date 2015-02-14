class DropArticles < ActiveRecord::Migration
  def down
    def drop
      #drop_table "articles", force:
      #drop_table "comments", force:   

      #delete_index "comments", ["post_id"], name: "index_comments_on_post_id"

      #drop_table "posts", force: 
      #drop_table "system_settings", force:
    end
  end
end
