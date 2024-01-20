require "application_system_test_case"

class PartnerOrdersTest < ApplicationSystemTestCase
  setup do
    @partner_order = partner_orders(:one)
  end

  test "visiting the index" do
    visit partner_orders_url
    assert_selector "h1", text: "Partner orders"
  end

  test "should create partner order" do
    visit partner_orders_url
    click_on "New partner order"

    fill_in "Assigned at", with: @partner_order.assigned_at
    fill_in "Customer review", with: @partner_order.customer_review
    fill_in "Delivered at", with: @partner_order.delivered_at
    fill_in "Notification response due by", with: @partner_order.notification_response_due_by
    fill_in "Notification sent at", with: @partner_order.notification_sent_at
    fill_in "Order", with: @partner_order.order_id
    fill_in "Partner", with: @partner_order.partner_id
    fill_in "Partner status", with: @partner_order.partner_status
    fill_in "Pickup at", with: @partner_order.pickup_at
    fill_in "Responded at", with: @partner_order.responded_at
    click_on "Create Partner order"

    assert_text "Partner order was successfully created"
    click_on "Back"
  end

  test "should update Partner order" do
    visit partner_order_url(@partner_order)
    click_on "Edit this partner order", match: :first

    fill_in "Assigned at", with: @partner_order.assigned_at
    fill_in "Customer review", with: @partner_order.customer_review
    fill_in "Delivered at", with: @partner_order.delivered_at
    fill_in "Notification response due by", with: @partner_order.notification_response_due_by
    fill_in "Notification sent at", with: @partner_order.notification_sent_at
    fill_in "Order", with: @partner_order.order_id
    fill_in "Partner", with: @partner_order.partner_id
    fill_in "Partner status", with: @partner_order.partner_status
    fill_in "Pickup at", with: @partner_order.pickup_at
    fill_in "Responded at", with: @partner_order.responded_at
    click_on "Update Partner order"

    assert_text "Partner order was successfully updated"
    click_on "Back"
  end

  test "should destroy Partner order" do
    visit partner_order_url(@partner_order)
    click_on "Destroy this partner order", match: :first

    assert_text "Partner order was successfully destroyed"
  end
end
