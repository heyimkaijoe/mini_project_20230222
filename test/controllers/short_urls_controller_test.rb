require "test_helper"

class ShortUrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get "/users/sign_in"
    sign_in users(:one)
    post user_session_url
  end

  test "should get index" do
    get short_urls_path
    assert_response :success
  end

end
