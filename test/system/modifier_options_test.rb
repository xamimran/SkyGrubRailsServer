require "application_system_test_case"

class ModifierOptionsTest < ApplicationSystemTestCase
  setup do
    @modifier_option = modifier_options(:one)
  end

  test "visiting the index" do
    visit modifier_options_url
    assert_selector "h1", text: "Modifier options"
  end

  test "should create modifier option" do
    visit modifier_options_url
    click_on "New modifier option"

    fill_in "Additional price", with: @modifier_option.additional_price
    fill_in "Modifier", with: @modifier_option.modifier_id
    fill_in "Name", with: @modifier_option.name
    click_on "Create Modifier option"

    assert_text "Modifier option was successfully created"
    click_on "Back"
  end

  test "should update Modifier option" do
    visit modifier_option_url(@modifier_option)
    click_on "Edit this modifier option", match: :first

    fill_in "Additional price", with: @modifier_option.additional_price
    fill_in "Modifier", with: @modifier_option.modifier_id
    fill_in "Name", with: @modifier_option.name
    click_on "Update Modifier option"

    assert_text "Modifier option was successfully updated"
    click_on "Back"
  end

  test "should destroy Modifier option" do
    visit modifier_option_url(@modifier_option)
    click_on "Destroy this modifier option", match: :first

    assert_text "Modifier option was successfully destroyed"
  end
end
