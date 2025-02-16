require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  ## Test api endpoints

  test "should get new" do
    get new_user_url
    assert_response :success
  end
  
  test "should create user" do
    post users_path, params: { user: { username: "controller", email_address: "controller@email.com", password: "password" } }
    assert_response :redirect

    assert User.find_by username: "controller"
  end


  ## Test authentication

  test "should redirect if unauthenticated" do
    # user = 
    get user_path("one1")
    assert_response :redirect
  end
end
