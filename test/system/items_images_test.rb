require "application_system_test_case"

class ItemsImagesTest < ApplicationSystemTestCase
  setup do
    @items_image = items_images(:one)
  end

  test "visiting the index" do
    visit items_images_url
    assert_selector "h1", text: "Items Images"
  end

  test "creating a Items image" do
    visit items_images_url
    click_on "New Items Image"

    click_on "Create Items image"

    assert_text "Items image was successfully created"
    click_on "Back"
  end

  test "updating a Items image" do
    visit items_images_url
    click_on "Edit", match: :first

    click_on "Update Items image"

    assert_text "Items image was successfully updated"
    click_on "Back"
  end

  test "destroying a Items image" do
    visit items_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Items image was successfully destroyed"
  end
end
