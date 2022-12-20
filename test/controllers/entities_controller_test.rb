require "test_helper"

class EntitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get entities_index_url
    assert_response :success
  end

  test "should get show" do
    get entities_show_url
    assert_response :success
  end

  test "should get new" do
    get entities_new_url
    assert_response :success
  end

  test "should get create" do
    get entities_create_url
    assert_response :success
  end
end
