# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100624022455) do

  create_table "refactors", :force => true do |t|
    t.text     "body"
    t.text     "comment"
    t.integer  "snippet_id",                :null => false
    t.string   "language"
    t.integer  "user_id"
    t.string   "user_note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "karma",      :default => 0
  end

  add_index "refactors", ["created_at"], :name => "index_refactors_on_created_at"
  add_index "refactors", ["snippet_id"], :name => "index_refactors_on_snippet_id"
  add_index "refactors", ["updated_at"], :name => "index_refactors_on_updated_at"
  add_index "refactors", ["user_id"], :name => "index_refactors_on_user_id"

  create_table "snippets", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.text     "notes"
    t.string   "language"
    t.integer  "user_id",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "karma",      :default => 0
  end

  add_index "snippets", ["created_at"], :name => "index_snippets_on_created_at"
  add_index "snippets", ["language"], :name => "index_snippets_on_language"
  add_index "snippets", ["updated_at"], :name => "index_snippets_on_updated_at"
  add_index "snippets", ["user_id"], :name => "index_snippets_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "username",             :limit => 20,                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "snippet_id",    :null => false
    t.integer  "refactor_id"
    t.integer  "user_id",       :null => false
    t.integer  "vote_type",     :null => false
    t.integer  "vote_approved", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end