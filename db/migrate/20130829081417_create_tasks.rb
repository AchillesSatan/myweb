class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :user_id
      t.integer :project_id
      t.text :description
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
