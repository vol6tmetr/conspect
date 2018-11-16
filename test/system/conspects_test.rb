require "application_system_test_case"

class ConspectsTest < ApplicationSystemTestCase
  setup do
    @conspect = conspects(:one)
  end

  test "visiting the index" do
    visit conspects_url
    assert_selector "h1", text: "Conspects"
  end

  test "creating a Conspect" do
    visit conspects_url
    click_on "New Conspect"

    fill_in "Content", with: @conspect.content
    fill_in "Description", with: @conspect.description
    fill_in "Speciality Number", with: @conspect.speciality_number
    fill_in "Title", with: @conspect.title
    fill_in "User", with: @conspect.user_id
    click_on "Create Conspect"

    assert_text "Conspect was successfully created"
    click_on "Back"
  end

  test "updating a Conspect" do
    visit conspects_url
    click_on "Edit", match: :first

    fill_in "Content", with: @conspect.content
    fill_in "Description", with: @conspect.description
    fill_in "Speciality Number", with: @conspect.speciality_number
    fill_in "Title", with: @conspect.title
    fill_in "User", with: @conspect.user_id
    click_on "Update Conspect"

    assert_text "Conspect was successfully updated"
    click_on "Back"
  end

  test "destroying a Conspect" do
    visit conspects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Conspect was successfully destroyed"
  end
end
