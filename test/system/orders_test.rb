require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should create order" do
    visit orders_url
    click_on "New order"

    fill_in "Cancellation reason", with: @order.cancellation_reason
    check "Cancelled" if @order.cancelled
    fill_in "Cancelled at", with: @order.cancelled_at
    fill_in "Delivery address", with: @order.delivery_address
    fill_in "Delivery fee", with: @order.delivery_fee
    fill_in "Delivery mileage", with: @order.delivery_mileage
    fill_in "Estimated wait time", with: @order.estimated_wait_time
    fill_in "Partner review", with: @order.partner_review
    fill_in "Restaurant", with: @order.restaurant_id
    fill_in "Status", with: @order.status
    fill_in "Tip amount", with: @order.tip_amount
    fill_in "Total price", with: @order.total_price
    fill_in "User", with: @order.user_id
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "should update Order" do
    visit order_url(@order)
    click_on "Edit this order", match: :first

    fill_in "Cancellation reason", with: @order.cancellation_reason
    check "Cancelled" if @order.cancelled
    fill_in "Cancelled at", with: @order.cancelled_at
    fill_in "Delivery address", with: @order.delivery_address
    fill_in "Delivery fee", with: @order.delivery_fee
    fill_in "Delivery mileage", with: @order.delivery_mileage
    fill_in "Estimated wait time", with: @order.estimated_wait_time
    fill_in "Partner review", with: @order.partner_review
    fill_in "Restaurant", with: @order.restaurant_id
    fill_in "Status", with: @order.status
    fill_in "Tip amount", with: @order.tip_amount
    fill_in "Total price", with: @order.total_price
    fill_in "User", with: @order.user_id
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "should destroy Order" do
    visit order_url(@order)
    click_on "Destroy this order", match: :first

    assert_text "Order was successfully destroyed"
  end
end
