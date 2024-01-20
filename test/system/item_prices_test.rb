require "application_system_test_case"

class ItemPricesTest < ApplicationSystemTestCase
  setup do
    @item_price = item_prices(:one)
  end

  test "visiting the index" do
    visit item_prices_url
    assert_selector "h1", text: "Item prices"
  end

  test "should create item price" do
    visit item_prices_url
    click_on "New item price"

    fill_in "Base price", with: @item_price.base_price
    fill_in "Menu item", with: @item_price.menu_item_id
    click_on "Create Item price"

    assert_text "Item price was successfully created"
    click_on "Back"
  end

  test "should update Item price" do
    visit item_price_url(@item_price)
    click_on "Edit this item price", match: :first

    fill_in "Base price", with: @item_price.base_price
    fill_in "Menu item", with: @item_price.menu_item_id
    click_on "Update Item price"

    assert_text "Item price was successfully updated"
    click_on "Back"
  end

  test "should destroy Item price" do
    visit item_price_url(@item_price)
    click_on "Destroy this item price", match: :first

    assert_text "Item price was successfully destroyed"
  end
end
