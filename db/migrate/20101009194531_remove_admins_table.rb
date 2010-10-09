class RemoveAdminsTable < ActiveRecord::Migration
  def self.up
    drop_table :admins
  end

  def self.down
    create_table "admins", :force => true do |t|
      t.string   "email",                             :default => "", :null => false
      t.string   "encrypted_password", :limit => 128, :default => "", :null => false
      t.string   "password_salt",                     :default => "", :null => false
      t.integer  "failed_attempts",                   :default => 0
      t.string   "unlock_token"
      t.datetime "locked_at"
      t.integer  "sign_in_count",                     :default => 0
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  end
end
