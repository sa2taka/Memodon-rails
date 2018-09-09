require 'test_helper'

class MemoControllerTest < ActionDispatch::IntegrationTest
  test "should get crawl" do
    get memo_crawl_url
    assert_response :success
  end

end
