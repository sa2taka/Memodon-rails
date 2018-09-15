require 'test_helper'

class Api::MemoControllerTest < ActionDispatch::IntegrationTest
  test "should get crawl" do
    get memo_crawl_url
    assert_response :success
  end

end
