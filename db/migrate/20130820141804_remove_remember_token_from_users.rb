class RemoveRememberTokenFromUsers < ActiveRecord::Migration
  def up
  	remove_index :users, :remember_token
  	remove_column :users, :remember_token
  end

  def down

  end
end
