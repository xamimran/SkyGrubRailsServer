require "test_helper"

class PartnerOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partner_order = partner_orders(:one)
  end

  test "should get index" do
    get partner_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_partner_order_url
    assert_response :success
  end

  test "should create partner_order" do
    assert_difference("PartnerOrder.count") do
      post partner_orders_url, params: { partner_order: { assigned_at: @partner_order.assigned_at, customer_review: @partner_order.customer_review, delivered_at: @partner_order.delivered_at, notification_response_due_by: @partner_order.notification_response_due_by, notification_sent_at: @partner_order.notification_sent_at, order_id: @partner_order.order_id, partner_id: @partner_order.partner_id, partner_status: @partner_order.partner_status, pickup_at: @partner_order.pickup_at, responded_at: @partner_order.responded_at } }
    end

    assert_redirected_to partner_order_url(PartnerOrder.last)
  end

  test "should show partner_order" do
    get partner_order_url(@partner_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_partner_order_url(@partner_order)
    assert_response :success
  end

  test "should update partner_order" do
    patch partner_order_url(@partner_order), params: { partner_order: { assigned_at: @partner_order.assigned_at, customer_review: @partner_order.customer_review, delivered_at: @partner_order.delivered_at, notification_response_due_by: @partner_order.notification_response_due_by, notification_sent_at: @partner_order.notification_sent_at, order_id: @partner_order.order_id, partner_id: @partner_order.partner_id, partner_status: @partner_order.partner_status, pickup_at: @partner_order.pickup_at, responded_at: @partner_order.responded_at } }
    assert_redirected_to partner_order_url(@partner_order)
  end

  test "should destroy partner_order" do
    assert_difference("PartnerOrder.count", -1) do
      delete partner_order_url(@partner_order)
    end

    assert_redirected_to partner_orders_url
  end
end
