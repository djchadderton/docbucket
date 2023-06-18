class AddFolderToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :folder, null: false, foreign_key: true
  end
end
