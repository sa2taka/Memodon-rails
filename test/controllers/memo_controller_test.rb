require 'test_helper'

class MemoControllerTest < ActionDispatch::IntegrationTest
  test "should get crawl" do
    post memo_crawl_url
    assert_response :success
  end

  test "should get crawling" do
    get memo_crawling_url
    assert_response :success
  end

end
