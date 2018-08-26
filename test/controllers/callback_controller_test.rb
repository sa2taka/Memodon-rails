require 'test_helper'

class CallbackControllerTest < ActionDispatch::IntegrationTest
  test "should get oauth" do
    get callback_oauth_url
    assert_response :success
  end

end
