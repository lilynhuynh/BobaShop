require "test_helper"

class BobaShopControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get boba_shop_index_url
    assert_response :success
  end
end
