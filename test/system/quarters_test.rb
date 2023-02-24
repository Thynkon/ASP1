require "application_system_test_case"

class QuartersTest < ApplicationSystemTestCase
  setup do
    @quarter = quarters(:one)
  end

  test "visiting the index" do
    visit quarters_url
    assert_selector "h1", text: "Quarters"
  end

  test "should create quarter" do
    visit quarters_url
    click_on "New quarter"

    fill_in "Ended at", with: @quarter.ended_at
    fill_in "Started at", with: @quarter.started_at
    click_on "Create Quarter"

    assert_text "Quarter was successfully created"
    click_on "Back"
  end

  test "should update Quarter" do
    visit quarter_url(@quarter)
    click_on "Edit this quarter", match: :first

    fill_in "Ended at", with: @quarter.ended_at
    fill_in "Started at", with: @quarter.started_at
    click_on "Update Quarter"

    assert_text "Quarter was successfully updated"
    click_on "Back"
  end

  test "should destroy Quarter" do
    visit quarter_url(@quarter)
    click_on "Destroy this quarter", match: :first

    assert_text "Quarter was successfully destroyed"
  end
end
