class AddAuthToUser < ActiveRecord::Migration
  def change
    add_column :users, :auth, :boolean, :default => false
  end
end
