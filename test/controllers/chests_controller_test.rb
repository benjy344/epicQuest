require 'test_helper'

class ChestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chest = chests(:one)
  end

  test "should get index" do
    get chests_url
    assert_response :success
  end

  test "should get new" do
    get new_chest_url
    assert_response :success
  end

  test "should create chest" do
    assert_difference('Chest.count') do
      post chests_url, params: { chest: {  } }
    end

    assert_redirected_to chest_url(Chest.last)
  end

  test "should show chest" do
    get chest_url(@chest)
    assert_response :success
  end

  test "should get edit" do
    get edit_chest_url(@chest)
    assert_response :success
  end

  test "should update chest" do
    patch chest_url(@chest), params: { chest: {  } }
    assert_redirected_to chest_url(@chest)
  end

  test "should destroy chest" do
    assert_difference('Chest.count', -1) do
      delete chest_url(@chest)
    end

    assert_redirected_to chests_url
  end
end
