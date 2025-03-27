require "application_system_test_case"

class DeansTest < ApplicationSystemTestCase
  setup do
    @dean = deans(:one)
  end

  test "visiting the index" do
    visit deans_url
    assert_selector "h1", text: "Deans"
  end

  test "should create dean" do
    visit deans_url
    click_on "New dean"

    fill_in "Address", with: @dean.address_id
    fill_in "Email", with: @dean.email
    fill_in "Firstname", with: @dean.firstname
    fill_in "Iban", with: @dean.iban
    fill_in "Lastname", with: @dean.lastname
    fill_in "Person status", with: @dean.person_status_id
    fill_in "Phone number", with: @dean.phone_number
    fill_in "Type", with: @dean.type
    fill_in "Username", with: @dean.username
    click_on "Create Dean"

    assert_text "Dean was successfully created"
    click_on "Back"
  end

  test "should update Dean" do
    visit dean_url(@dean)
    click_on "Edit this dean", match: :first

    fill_in "Address", with: @dean.address_id
    fill_in "Email", with: @dean.email
    fill_in "Firstname", with: @dean.firstname
    fill_in "Iban", with: @dean.iban
    fill_in "Lastname", with: @dean.lastname
    fill_in "Person status", with: @dean.person_status_id
    fill_in "Phone number", with: @dean.phone_number
    fill_in "Type", with: @dean.type
    fill_in "Username", with: @dean.username
    click_on "Update Dean"

    assert_text "Dean was successfully updated"
    click_on "Back"
  end

  test "should destroy Dean" do
    visit dean_url(@dean)
    click_on "Destroy this dean", match: :first

    assert_text "Dean was successfully destroyed"
  end
end
