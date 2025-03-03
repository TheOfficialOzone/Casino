require "test_helper"

class ChatControllerTest < ActionDispatch::IntegrationTest
  test "should get send" do
    get chat_send_url
    assert_response :success
  end

  test "should get receive" do
    get chat_receive_url
    assert_response :success
  end
end
