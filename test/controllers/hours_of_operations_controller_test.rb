require "test_helper"

class HoursOfOperationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hours_of_operation = hours_of_operations(:one)
  end

  test "should get index" do
    get hours_of_operations_url
    assert_response :success
  end

  test "should get new" do
    get new_hours_of_operation_url
    assert_response :success
  end

  test "should create hours_of_operation" do
    assert_difference("HoursOfOperation.count") do
      post hours_of_operations_url, params: { hours_of_operation: { closeTime1: @hours_of_operation.closeTime1, closeTime2: @hours_of_operation.closeTime2, day: @hours_of_operation.day, openTime1: @hours_of_operation.openTime1, openTime2: @hours_of_operation.openTime2, restaurant_id: @hours_of_operation.restaurant_id } }
    end

    assert_redirected_to hours_of_operation_url(HoursOfOperation.last)
  end

  test "should show hours_of_operation" do
    get hours_of_operation_url(@hours_of_operation)
    assert_response :success
  end

  test "should get edit" do
    get edit_hours_of_operation_url(@hours_of_operation)
    assert_response :success
  end

  test "should update hours_of_operation" do
    patch hours_of_operation_url(@hours_of_operation), params: { hours_of_operation: { closeTime1: @hours_of_operation.closeTime1, closeTime2: @hours_of_operation.closeTime2, day: @hours_of_operation.day, openTime1: @hours_of_operation.openTime1, openTime2: @hours_of_operation.openTime2, restaurant_id: @hours_of_operation.restaurant_id } }
    assert_redirected_to hours_of_operation_url(@hours_of_operation)
  end

  test "should destroy hours_of_operation" do
    assert_difference("HoursOfOperation.count", -1) do
      delete hours_of_operation_url(@hours_of_operation)
    end

    assert_redirected_to hours_of_operations_url
  end
end
