require "application_system_test_case"

class PrivateInvitesTest < ApplicationSystemTestCase
  setup do
    @private_invite = private_invites(:one)
  end

  test "visiting the index" do
    visit private_invites_url
    assert_selector "h1", text: "Private invites"
  end

  test "should create private invite" do
    visit private_invites_url
    click_on "New private invite"

    click_on "Create Private invite"

    assert_text "Private invite was successfully created"
    click_on "Back"
  end

  test "should update Private invite" do
    visit private_invite_url(@private_invite)
    click_on "Edit this private invite", match: :first

    click_on "Update Private invite"

    assert_text "Private invite was successfully updated"
    click_on "Back"
  end

  test "should destroy Private invite" do
    visit private_invite_url(@private_invite)
    click_on "Destroy this private invite", match: :first

    assert_text "Private invite was successfully destroyed"
  end
end
