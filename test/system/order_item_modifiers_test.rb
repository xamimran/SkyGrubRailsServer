require "application_system_test_case"

class OrderItemModifiersTest < ApplicationSystemTestCase
  setup do
    @order_item_modifier = order_item_modifiers(:one)
  end

  test "visiting the index" do
    visit order_item_modifiers_url
    assert_selector "h1", text: "Order item modifiers"
  end

  test "should create order item modifier" do
    visit order_item_modifiers_url
    click_on "New order item modifier"

    fill_in "Modifier option", with: @order_item_modifier.modifier_option_id
    fill_in "Order item", with: @order_item_modifier.order_item_id
    click_on "Create Order item modifier"

    assert_text "Order item modifier was successfully created"
    click_on "Back"
  end

  test "should update Order item modifier" do
    visit order_item_modifier_url(@order_item_modifier)
    click_on "Edit this order item modifier", match: :first

    fill_in "Modifier option", with: @order_item_modifier.modifier_option_id
    fill_in "Order item", with: @order_item_modifier.order_item_id
    click_on "Update Order item modifier"

    assert_text "Order item modifier was successfully updated"
    click_on "Back"
  end

  test "should destroy Order item modifier" do
    visit order_item_modifier_url(@order_item_modifier)
    click_on "Destroy this order item modifier", match: :first

    assert_text "Order item modifier was successfully destroyed"
  end
end
