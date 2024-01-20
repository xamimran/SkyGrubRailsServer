require "test_helper"

class ModifierOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @modifier_option = modifier_options(:one)
  end

  test "should get index" do
    get modifier_options_url
    assert_response :success
  end

  test "should get new" do
    get new_modifier_option_url
    assert_response :success
  end

  test "should create modifier_option" do
    assert_difference("ModifierOption.count") do
      post modifier_options_url, params: { modifier_option: { additional_price: @modifier_option.additional_price, modifier_id: @modifier_option.modifier_id, name: @modifier_option.name } }
    end

    assert_redirected_to modifier_option_url(ModifierOption.last)
  end

  test "should show modifier_option" do
    get modifier_option_url(@modifier_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_modifier_option_url(@modifier_option)
    assert_response :success
  end

  test "should update modifier_option" do
    patch modifier_option_url(@modifier_option), params: { modifier_option: { additional_price: @modifier_option.additional_price, modifier_id: @modifier_option.modifier_id, name: @modifier_option.name } }
    assert_redirected_to modifier_option_url(@modifier_option)
  end

  test "should destroy modifier_option" do
    assert_difference("ModifierOption.count", -1) do
      delete modifier_option_url(@modifier_option)
    end

    assert_redirected_to modifier_options_url
  end
end
