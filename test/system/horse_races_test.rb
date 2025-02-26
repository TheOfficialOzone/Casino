require "application_system_test_case"

class HorseRacesTest < ApplicationSystemTestCase
  setup do
    @horse_race = horse_races(:one)
  end

  test "visiting the index" do
    visit horse_races_url
    assert_selector "h1", text: "Horse races"
  end

  test "should create horse race" do
    visit horse_races_url
    click_on "New horse race"

    click_on "Create Horse race"

    assert_text "Horse race was successfully created"
    click_on "Back"
  end

  test "should update Horse race" do
    visit horse_race_url(@horse_race)
    click_on "Edit this horse race", match: :first

    click_on "Update Horse race"

    assert_text "Horse race was successfully updated"
    click_on "Back"
  end

  test "should destroy Horse race" do
    visit horse_race_url(@horse_race)
    click_on "Destroy this horse race", match: :first

    assert_text "Horse race was successfully destroyed"
  end
end
