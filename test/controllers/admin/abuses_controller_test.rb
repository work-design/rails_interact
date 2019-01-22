require 'test_helper'

class Admin::AbusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_abus = admin_abuses(:one)
  end

  test "should get index" do
    get admin_abuses_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_abus_url
    assert_response :success
  end

  test "should create admin_abus" do
    assert_difference('Abuse.count') do
      post admin_abuses_url, params: { admin_abus: { abusement: @admin_abus.abusement, note: @admin_abus.note, state: @admin_abus.state, user: @admin_abus.user } }
    end

    assert_redirected_to admin_abus_url(Abuse.last)
  end

  test "should show admin_abus" do
    get admin_abus_url(@admin_abus)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_abus_url(@admin_abus)
    assert_response :success
  end

  test "should update admin_abus" do
    patch admin_abus_url(@admin_abus), params: { admin_abus: { abusement: @admin_abus.abusement, note: @admin_abus.note, state: @admin_abus.state, user: @admin_abus.user } }
    assert_redirected_to admin_abus_url(@admin_abus)
  end

  test "should destroy admin_abus" do
    assert_difference('Abuse.count', -1) do
      delete admin_abus_url(@admin_abus)
    end

    assert_redirected_to admin_abuses_url
  end
end
