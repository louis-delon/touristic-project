require 'test_helper'

class SectorsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sectors_create_url
    assert_response :success
  end

  test "should get edit" do
    get sectors_edit_url
    assert_response :success
  end

  test "should get update" do
    get sectors_update_url
    assert_response :success
  end

  test "should get show" do
    get sectors_show_url
    assert_response :success
  end

  test "should get delete" do
    get sectors_delete_url
    assert_response :success
  end

end
