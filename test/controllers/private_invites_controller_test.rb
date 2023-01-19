require "test_helper"

class PrivateInvitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @private_invite = private_invites(:one)
  end

  test "should get index" do
    get private_invites_url
    assert_response :success
  end

  test "should get new" do
    get new_private_invite_url
    assert_response :success
  end

  test "should create private_invite" do
    assert_difference("PrivateInvite.count") do
      post private_invites_url, params: { private_invite: {  } }
    end

    assert_redirected_to private_invite_url(PrivateInvite.last)
  end

  test "should show private_invite" do
    get private_invite_url(@private_invite)
    assert_response :success
  end

  test "should get edit" do
    get edit_private_invite_url(@private_invite)
    assert_response :success
  end

  test "should update private_invite" do
    patch private_invite_url(@private_invite), params: { private_invite: {  } }
    assert_redirected_to private_invite_url(@private_invite)
  end

  test "should destroy private_invite" do
    assert_difference("PrivateInvite.count", -1) do
      delete private_invite_url(@private_invite)
    end

    assert_redirected_to private_invites_url
  end
end
