require "application_system_test_case"

class HoursOfOperationsTest < ApplicationSystemTestCase
  setup do
    @hours_of_operation = hours_of_operations(:one)
  end

  test "visiting the index" do
    visit hours_of_operations_url
    assert_selector "h1", text: "Hours of operations"
  end

  test "should create hours of operation" do
    visit hours_of_operations_url
    click_on "New hours of operation"

    fill_in "Closetime1", with: @hours_of_operation.closeTime1
    fill_in "Closetime2", with: @hours_of_operation.closeTime2
    fill_in "Day", with: @hours_of_operation.day
    fill_in "Opentime1", with: @hours_of_operation.openTime1
    fill_in "Opentime2", with: @hours_of_operation.openTime2
    fill_in "Restaurant", with: @hours_of_operation.restaurant_id
    click_on "Create Hours of operation"

    assert_text "Hours of operation was successfully created"
    click_on "Back"
  end

  test "should update Hours of operation" do
    visit hours_of_operation_url(@hours_of_operation)
    click_on "Edit this hours of operation", match: :first

    fill_in "Closetime1", with: @hours_of_operation.closeTime1
    fill_in "Closetime2", with: @hours_of_operation.closeTime2
    fill_in "Day", with: @hours_of_operation.day
    fill_in "Opentime1", with: @hours_of_operation.openTime1
    fill_in "Opentime2", with: @hours_of_operation.openTime2
    fill_in "Restaurant", with: @hours_of_operation.restaurant_id
    click_on "Update Hours of operation"

    assert_text "Hours of operation was successfully updated"
    click_on "Back"
  end

  test "should destroy Hours of operation" do
    visit hours_of_operation_url(@hours_of_operation)
    click_on "Destroy this hours of operation", match: :first

    assert_text "Hours of operation was successfully destroyed"
  end
end
