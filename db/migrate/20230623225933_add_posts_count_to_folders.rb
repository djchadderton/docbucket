class AddPostsCountToFolders < ActiveRecord::Migration[7.0]
  def change
    add_column :folders, :posts_count, :integer
  end
end
