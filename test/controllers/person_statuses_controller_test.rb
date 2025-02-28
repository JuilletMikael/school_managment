require "test_helper"

class PersonStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person_status = person_statuses(:one)
  end

  test "should get index" do
    get person_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_person_status_url
    assert_response :success
  end

  test "should create person_status" do
    assert_difference("PersonStatus.count") do
      post person_statuses_url, params: { person_status: { status: @person_status.status } }
    end

    assert_redirected_to person_status_url(PersonStatus.last)
  end

  test "should show person_status" do
    get person_status_url(@person_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_status_url(@person_status)
    assert_response :success
  end

  test "should update person_status" do
    patch person_status_url(@person_status), params: { person_status: { status: @person_status.status } }
    assert_redirected_to person_status_url(@person_status)
  end

  test "should destroy person_status" do
    assert_difference("PersonStatus.count", -1) do
      delete person_status_url(@person_status)
    end

    assert_redirected_to person_statuses_url
  end
end
