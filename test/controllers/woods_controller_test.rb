require "test_helper"

class WoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get woods_top_url
    assert_response :success
  end
end
