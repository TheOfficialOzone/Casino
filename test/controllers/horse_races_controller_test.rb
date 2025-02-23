require "test_helper"

class HorseRacesControllerTest < ActionDispatch::IntegrationTest
  test "should get race betting path" do
    post session_path, params: { session: { username: "one1", password: "password" } }
    assert_response :redirect
    get horse_race_betting_path
    assert_response :success
  end
end
