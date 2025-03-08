require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "should create student" do
    visit students_url
    click_on "New student"

    fill_in "Address", with: @student.address_id
    fill_in "Email", with: @student.email
    fill_in "Firstname", with: @student.firstname
    fill_in "Lastname", with: @student.lastname
    fill_in "Person status", with: @student.person_status_id
    fill_in "Phone number", with: @student.phone_number
    fill_in "Type", with: @student.type
    fill_in "Username", with: @student.username
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "should update Student" do
    visit student_url(@student)
    click_on "Edit this student", match: :first

    fill_in "Address", with: @student.address_id
    fill_in "Email", with: @student.email
    fill_in "Firstname", with: @student.firstname
    fill_in "Lastname", with: @student.lastname
    fill_in "Person status", with: @student.person_status_id
    fill_in "Phone number", with: @student.phone_number
    fill_in "Type", with: @student.type
    fill_in "Username", with: @student.username
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "should destroy Student" do
    visit student_url(@student)
    click_on "Destroy this student", match: :first

    assert_text "Student was successfully destroyed"
  end
end
