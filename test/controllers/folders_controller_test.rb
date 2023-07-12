require "test_helper"

class FoldersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @folder = folders(:one)
  end

  test "should get index" do
    get folders_url
    assert_response :success
  end

  test "should get new" do
    get new_folder_url
    assert_response :success
  end

  test "should create folder" do
    log_in
    assert_difference("Folder.count") do
      post folders_url, params: {folder: {name: "new folder"}}
    end

    assert_redirected_to folder_url(Folder.last)
  end

  test "should show folder" do
    get folder_url(@folder)
    assert_response :success
  end

  test "should get edit" do
    get edit_folder_url(@folder)
    assert_response :success
  end

  test "should update folder" do
    log_in
    patch folder_url(@folder), params: {folder: {name: "alter name"}}
    assert_redirected_to folder_url(@folder)
  end

  test "should destroy folder" do
    log_in
    assert_difference("Folder.count", -1) do
      delete folder_url(@folder)
    end

    assert_redirected_to folders_url
  end
end
