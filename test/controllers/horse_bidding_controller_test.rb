require "test_helper"

class HorseBiddingControllerTest < ActionDispatch::IntegrationTest
  test "should get menu" do
    get horse_bidding_menu_url
    assert_response :success
  end
end
