require "test_helper"

class DeansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dean = deans(:one)
  end

  test "should get index" do
    get deans_url
    assert_response :success
  end

  test "should get new" do
    get new_dean_url
    assert_response :success
  end

  test "should create dean" do
    assert_difference("Dean.count") do
      post deans_url, params: { dean: { address_id: @dean.address_id, email: @dean.email, firstname: @dean.firstname, iban: @dean.iban, lastname: @dean.lastname, person_status_id: @dean.person_status_id, phone_number: @dean.phone_number, type: @dean.type, username: @dean.username } }
    end

    assert_redirected_to dean_url(Dean.last)
  end

  test "should show dean" do
    get dean_url(@dean)
    assert_response :success
  end

  test "should get edit" do
    get edit_dean_url(@dean)
    assert_response :success
  end

  test "should update dean" do
    patch dean_url(@dean), params: { dean: { address_id: @dean.address_id, email: @dean.email, firstname: @dean.firstname, iban: @dean.iban, lastname: @dean.lastname, person_status_id: @dean.person_status_id, phone_number: @dean.phone_number, type: @dean.type, username: @dean.username } }
    assert_redirected_to dean_url(@dean)
  end

  test "should destroy dean" do
    assert_difference("Dean.count", -1) do
      delete dean_url(@dean)
    end

    assert_redirected_to deans_url
  end
end
