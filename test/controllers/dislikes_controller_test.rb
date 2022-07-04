require "test_helper"

class DislikesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dislikes_new_url
    assert_response :success
  end

  test "should get create" do
    get dislikes_create_url
    assert_response :success
  end

  test "should get show" do
    get dislikes_show_url
    assert_response :success
  end

  test "should get destroy" do
    get dislikes_destroy_url
    assert_response :success
  end
end
