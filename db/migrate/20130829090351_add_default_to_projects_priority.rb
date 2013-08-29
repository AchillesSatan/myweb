class AddDefaultToProjectsPriority < ActiveRecord::Migration
  def change
  	change_table :projects do |t|
  		t.remove :priority
  		t.integer :priority, :default => false
	end
  end
end
