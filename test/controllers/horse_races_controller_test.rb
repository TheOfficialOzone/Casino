require "test_helper"

class HorseRacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @horse_race = horse_races(:one)
  end

  test "should get index" do
    get horse_races_url
    assert_response :success
  end

  test "should get new" do
    get new_horse_race_url
    assert_response :success
  end

  test "should create horse_race" do
    assert_difference("HorseRace.count") do
      post horse_races_url, params: { horse_race: {} }
    end

    assert_redirected_to horse_race_url(HorseRace.last)
  end

  test "should show horse_race" do
    get horse_race_url(@horse_race)
    assert_response :success
  end

  test "should get edit" do
    get edit_horse_race_url(@horse_race)
    assert_response :success
  end

  test "should update horse_race" do
    patch horse_race_url(@horse_race), params: { horse_race: {} }
    assert_redirected_to horse_race_url(@horse_race)
  end

  test "should destroy horse_race" do
    assert_difference("HorseRace.count", -1) do
      delete horse_race_url(@horse_race)
    end

    assert_redirected_to horse_races_url
  end
end
