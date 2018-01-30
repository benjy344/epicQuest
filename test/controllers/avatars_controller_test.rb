require 'test_helper'

class AvatarsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get avatars_new_url
    assert_response :success
  end

  test "should get create" do
    get avatars_create_url
    assert_response :success
  end

  test "should get update" do
    get avatars_update_url
    assert_response :success
  end

  test "should get edit" do
    get avatars_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get avatars_destroy_url
    assert_response :success
  end

  test "should get index" do
    get avatars_index_url
    assert_response :success
  end

  test "should get show" do
    get avatars_show_url
    assert_response :success
  end

end
