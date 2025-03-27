require "application_system_test_case"

class PersonStatusesTest < ApplicationSystemTestCase
  setup do
    @person_status = person_statuses(:one)
  end

  test "visiting the index" do
    visit person_statuses_url
    assert_selector "h1", text: "Person statuses"
  end

  test "should create person status" do
    visit person_statuses_url
    click_on "New person status"

    fill_in "Status", with: @person_status.status
    click_on "Create Person status"

    assert_text "Person status was successfully created"
    click_on "Back"
  end

  test "should update Person status" do
    visit person_status_url(@person_status)
    click_on "Edit this person status", match: :first

    fill_in "Status", with: @person_status.status
    click_on "Update Person status"

    assert_text "Person status was successfully updated"
    click_on "Back"
  end

  test "should destroy Person status" do
    visit person_status_url(@person_status)
    click_on "Destroy this person status", match: :first

    assert_text "Person status was successfully destroyed"
  end
end
