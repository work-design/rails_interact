require "application_system_test_case"

class AbusesTest < ApplicationSystemTestCase
  setup do
    @admin_abus = admin_abuses(:one)
  end

  test "visiting the index" do
    visit admin_abuses_url
    assert_selector "h1", text: "Abuses"
  end

  test "creating a Abuse" do
    visit admin_abuses_url
    click_on "New Abuse"

    fill_in "Abusement", with: @admin_abus.abusement
    fill_in "Note", with: @admin_abus.note
    fill_in "State", with: @admin_abus.state
    fill_in "User", with: @admin_abus.user
    click_on "Create Abuse"

    assert_text "Abuse was successfully created"
    click_on "Back"
  end

  test "updating a Abuse" do
    visit admin_abuses_url
    click_on "Edit", match: :first

    fill_in "Abusement", with: @admin_abus.abusement
    fill_in "Note", with: @admin_abus.note
    fill_in "State", with: @admin_abus.state
    fill_in "User", with: @admin_abus.user
    click_on "Update Abuse"

    assert_text "Abuse was successfully updated"
    click_on "Back"
  end

  test "destroying a Abuse" do
    visit admin_abuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Abuse was successfully destroyed"
  end
end
