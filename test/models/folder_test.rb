# == Schema Information
#
# Table name: folders
#
#  id          :bigint           not null, primary key
#  name        :string
#  posts_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class FolderTest < ActiveSupport::TestCase
  test "news attributes should not be empty" do
    @folder = Folder.new
    assert @folder.invalid?
    assert @folder.errors[:name].any?
  end
end
