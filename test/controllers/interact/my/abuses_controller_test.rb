require 'test_helper'

class Interact::My::AbusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @abuse = create :abuse
  end

  test "should get index" do
    get abusees_url, as: :json
    assert_response :success
  end

  test "should create abuse" do
    assert_difference('Abuse.count') do
      post abusees_url, params: { abuse: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show abuse" do
    get abuse_url(@abuse), as: :json
    assert_response :success
  end

  test "should update abuse" do
    patch abuse_url(@abuse), params: { abuse: {  } }, as: :json
    assert_response 200
  end

  test "should destroy abuse" do
    assert_difference('Abuse.count', -1) do
      delete abuse_url(@abuse), as: :json
    end

    assert_response 204
  end
end
