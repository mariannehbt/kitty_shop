require 'test_helper'

class ItemsImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @items_image = items_images(:one)
  end

  test "should get index" do
    get items_images_url
    assert_response :success
  end

  test "should get new" do
    get new_items_image_url
    assert_response :success
  end

  test "should create items_image" do
    assert_difference('ItemsImage.count') do
      post items_images_url, params: { items_image: {  } }
    end

    assert_redirected_to items_image_url(ItemsImage.last)
  end

  test "should show items_image" do
    get items_image_url(@items_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_items_image_url(@items_image)
    assert_response :success
  end

  test "should update items_image" do
    patch items_image_url(@items_image), params: { items_image: {  } }
    assert_redirected_to items_image_url(@items_image)
  end

  test "should destroy items_image" do
    assert_difference('ItemsImage.count', -1) do
      delete items_image_url(@items_image)
    end

    assert_redirected_to items_images_url
  end
end
