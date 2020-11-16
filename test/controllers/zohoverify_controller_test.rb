require 'test_helper'

class ZohoverifyControllerTest < ActionDispatch::IntegrationTest
  test "should get verifyforzoho" do
    get zohoverify_verifyforzoho_url
    assert_response :success
  end

end
