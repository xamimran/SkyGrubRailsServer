require "application_system_test_case"

class ModifiersTest < ApplicationSystemTestCase
  setup do
    @modifier = modifiers(:one)
  end

  test "visiting the index" do
    visit modifiers_url
    assert_selector "h1", text: "Modifiers"
  end

  test "should create modifier" do
    visit modifiers_url
    click_on "New modifier"

    fill_in "Name", with: @modifier.name
    click_on "Create Modifier"

    assert_text "Modifier was successfully created"
    click_on "Back"
  end

  test "should update Modifier" do
    visit modifier_url(@modifier)
    click_on "Edit this modifier", match: :first

    fill_in "Name", with: @modifier.name
    click_on "Update Modifier"

    assert_text "Modifier was successfully updated"
    click_on "Back"
  end

  test "should destroy Modifier" do
    visit modifier_url(@modifier)
    click_on "Destroy this modifier", match: :first

    assert_text "Modifier was successfully destroyed"
  end
end
