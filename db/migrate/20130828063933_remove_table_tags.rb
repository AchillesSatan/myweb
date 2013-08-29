class RemoveTableTags < ActiveRecord::Migration
  def up
  	drop_table :tags
  	drop_table :tag_blogs
  end

  def down
  end
end
