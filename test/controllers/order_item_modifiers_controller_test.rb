require "test_helper"

class OrderItemModifiersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_item_modifier = order_item_modifiers(:one)
  end

  test "should get index" do
    get order_item_modifiers_url
    assert_response :success
  end

  test "should get new" do
    get new_order_item_modifier_url
    assert_response :success
  end

  test "should create order_item_modifier" do
    assert_difference("OrderItemModifier.count") do
      post order_item_modifiers_url, params: { order_item_modifier: { modifier_option_id: @order_item_modifier.modifier_option_id, order_item_id: @order_item_modifier.order_item_id } }
    end

    assert_redirected_to order_item_modifier_url(OrderItemModifier.last)
  end

  test "should show order_item_modifier" do
    get order_item_modifier_url(@order_item_modifier)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_item_modifier_url(@order_item_modifier)
    assert_response :success
  end

  test "should update order_item_modifier" do
    patch order_item_modifier_url(@order_item_modifier), params: { order_item_modifier: { modifier_option_id: @order_item_modifier.modifier_option_id, order_item_id: @order_item_modifier.order_item_id } }
    assert_redirected_to order_item_modifier_url(@order_item_modifier)
  end

  test "should destroy order_item_modifier" do
    assert_difference("OrderItemModifier.count", -1) do
      delete order_item_modifier_url(@order_item_modifier)
    end

    assert_redirected_to order_item_modifiers_url
  end
end
