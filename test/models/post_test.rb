# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  folder_id  :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_folder_id  (folder_id)
#  index_posts_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (folder_id => folders.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "post attributes should not be empty" do
    @post = Post.new
    assert @post.invalid?
    assert @post.errors[:title].any?
  end
end
