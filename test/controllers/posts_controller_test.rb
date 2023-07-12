require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    log_in
    assert_difference("Post.count") do
      post posts_url, params: {post: {title: "New title", user_id: users(:one).id, folder_id: folders(:one).id}}
    end
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    log_in
    patch post_url(@post), params: {post: {title: "new title"}}
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    log_in
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
