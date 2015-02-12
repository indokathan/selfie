class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :sting
  end
end
