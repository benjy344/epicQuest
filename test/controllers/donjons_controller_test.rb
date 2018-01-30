require 'test_helper'

class DonjonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @donjon = donjons(:one)
  end

  test "should get index" do
    get donjons_url
    assert_response :success
  end

  test "should get new" do
    get new_donjon_url
    assert_response :success
  end

  test "should create donjon" do
    assert_difference('Donjon.count') do
      post donjons_url, params: { donjon: { level: @donjon.level, name: @donjon.name } }
    end

    assert_redirected_to donjon_url(Donjon.last)
  end

  test "should show donjon" do
    get donjon_url(@donjon)
    assert_response :success
  end

  test "should get edit" do
    get edit_donjon_url(@donjon)
    assert_response :success
  end

  test "should update donjon" do
    patch donjon_url(@donjon), params: { donjon: { level: @donjon.level, name: @donjon.name } }
    assert_redirected_to donjon_url(@donjon)
  end

  test "should destroy donjon" do
    assert_difference('Donjon.count', -1) do
      delete donjon_url(@donjon)
    end

    assert_redirected_to donjons_url
  end
end
