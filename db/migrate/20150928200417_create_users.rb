class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string "first_name",  :limit=> 25
      t.string "last_name", :limit => 50
      t.string "username", :limit => 25, :default =>"", :null =>false
      t.string "hashed_password", :limit => 25, :default =>"", :null =>false

      t.string "email", :default =>"",:limit => 100, :null =>false
      t.string "password", :limit=> 40
      # t.datetime "created_at"
      # t.datetime "updated_at"
      t.timestamps null: false
      end
    add_index("users", "username")
  end

  def down
      drop_table :users
  end
end
