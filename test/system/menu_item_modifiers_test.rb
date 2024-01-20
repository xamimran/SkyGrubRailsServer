require "application_system_test_case"

class MenuItemModifiersTest < ApplicationSystemTestCase
  setup do
    @menu_item_modifier = menu_item_modifiers(:one)
  end

  test "visiting the index" do
    visit menu_item_modifiers_url
    assert_selector "h1", text: "Menu item modifiers"
  end

  test "should create menu item modifier" do
    visit menu_item_modifiers_url
    click_on "New menu item modifier"

    fill_in "Menu item", with: @menu_item_modifier.menu_item_id
    fill_in "Modifier", with: @menu_item_modifier.modifier_id
    check "Primary" if @menu_item_modifier.primary
    click_on "Create Menu item modifier"

    assert_text "Menu item modifier was successfully created"
    click_on "Back"
  end

  test "should update Menu item modifier" do
    visit menu_item_modifier_url(@menu_item_modifier)
    click_on "Edit this menu item modifier", match: :first

    fill_in "Menu item", with: @menu_item_modifier.menu_item_id
    fill_in "Modifier", with: @menu_item_modifier.modifier_id
    check "Primary" if @menu_item_modifier.primary
    click_on "Update Menu item modifier"

    assert_text "Menu item modifier was successfully updated"
    click_on "Back"
  end

  test "should destroy Menu item modifier" do
    visit menu_item_modifier_url(@menu_item_modifier)
    click_on "Destroy this menu item modifier", match: :first

    assert_text "Menu item modifier was successfully destroyed"
  end
end
