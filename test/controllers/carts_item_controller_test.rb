require 'test_helper'

class CartsItemControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get carts_item_create_url
    assert_response :success
  end

  test "should get destroy" do
    get carts_item_destroy_url
    assert_response :success
  end

  test "should get add_quantity" do
    get carts_item_add_quantity_url
    assert_response :success
  end

  test "should get reduce_quantity" do
    get carts_item_reduce_quantity_url
    assert_response :success
  end

end
