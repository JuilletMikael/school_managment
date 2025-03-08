require "test_helper"

class TeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher = teachers(:one)
  end

  test "should get index" do
    get teachers_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_url
    assert_response :success
  end

  test "should create teacher" do
    assert_difference("Teacher.count") do
      post teachers_url, params: { teacher: { address_id: @teacher.address_id, email: @teacher.email, firstname: @teacher.firstname, iban: @teacher.iban, lastname: @teacher.lastname, person_status_id: @teacher.person_status_id, phone_number: @teacher.phone_number, type: @teacher.type, username: @teacher.username } }
    end

    assert_redirected_to teacher_url(Teacher.last)
  end

  test "should show teacher" do
    get teacher_url(@teacher)
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_url(@teacher)
    assert_response :success
  end

  test "should update teacher" do
    patch teacher_url(@teacher), params: { teacher: { address_id: @teacher.address_id, email: @teacher.email, firstname: @teacher.firstname, iban: @teacher.iban, lastname: @teacher.lastname, person_status_id: @teacher.person_status_id, phone_number: @teacher.phone_number, type: @teacher.type, username: @teacher.username } }
    assert_redirected_to teacher_url(@teacher)
  end

  test "should destroy teacher" do
    assert_difference("Teacher.count", -1) do
      delete teacher_url(@teacher)
    end

    assert_redirected_to teachers_url
  end
end
