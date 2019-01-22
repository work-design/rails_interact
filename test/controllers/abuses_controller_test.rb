require 'test_helper'

class AbusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @abus = abuses(:one)
  end

  test "should get index" do
    get abuses_url, as: :json
    assert_response :success
  end

  test "should create abus" do
    assert_difference('Abuse.count') do
      post abuses_url, params: { abus: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show abus" do
    get abus_url(@abus), as: :json
    assert_response :success
  end

  test "should update abus" do
    patch abus_url(@abus), params: { abus: {  } }, as: :json
    assert_response 200
  end

  test "should destroy abus" do
    assert_difference('Abuse.count', -1) do
      delete abus_url(@abus), as: :json
    end

    assert_response 204
  end
end
