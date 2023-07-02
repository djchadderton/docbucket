class AddDefaultAndNotNullToPostsCount < ActiveRecord::Migration[7.0]
  def change
    change_column_default :folders, :posts_count, from: nil, to: 1
    change_column_null :folders, :posts_count, false
  end
end
