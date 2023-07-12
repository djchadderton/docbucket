# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user attributes should not be empty" do
    @user = User.new
    assert @user.invalid?
    assert @user.errors[:username].any?
    assert @user.errors[:email].any?
  end
end
