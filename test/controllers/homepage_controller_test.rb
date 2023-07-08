require "test_helper"

class HomepageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get "/"
    assert_response :success
  end
end
