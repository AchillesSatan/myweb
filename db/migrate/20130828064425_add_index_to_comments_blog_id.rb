class AddIndexToCommentsBlogId < ActiveRecord::Migration
  def change
  	add_index :comments, :blog_id
  end
end
