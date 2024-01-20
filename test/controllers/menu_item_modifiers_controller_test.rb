require "test_helper"

class MenuItemModifiersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu_item_modifier = menu_item_modifiers(:one)
  end

  test "should get index" do
    get menu_item_modifiers_url
    assert_response :success
  end

  test "should get new" do
    get new_menu_item_modifier_url
    assert_response :success
  end

  test "should create menu_item_modifier" do
    assert_difference("MenuItemModifier.count") do
      post menu_item_modifiers_url, params: { menu_item_modifier: { menu_item_id: @menu_item_modifier.menu_item_id, modifier_id: @menu_item_modifier.modifier_id, primary: @menu_item_modifier.primary } }
    end

    assert_redirected_to menu_item_modifier_url(MenuItemModifier.last)
  end

  test "should show menu_item_modifier" do
    get menu_item_modifier_url(@menu_item_modifier)
    assert_response :success
  end

  test "should get edit" do
    get edit_menu_item_modifier_url(@menu_item_modifier)
    assert_response :success
  end

  test "should update menu_item_modifier" do
    patch menu_item_modifier_url(@menu_item_modifier), params: { menu_item_modifier: { menu_item_id: @menu_item_modifier.menu_item_id, modifier_id: @menu_item_modifier.modifier_id, primary: @menu_item_modifier.primary } }
    assert_redirected_to menu_item_modifier_url(@menu_item_modifier)
  end

  test "should destroy menu_item_modifier" do
    assert_difference("MenuItemModifier.count", -1) do
      delete menu_item_modifier_url(@menu_item_modifier)
    end

    assert_redirected_to menu_item_modifiers_url
  end
end
