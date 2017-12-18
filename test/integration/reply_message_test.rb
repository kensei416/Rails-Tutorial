require 'test_helper'

class ReplyMessageTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @ohter_user = users(:hide)
  end

  test "reply message" do
    log_in_as(@user)
    assert_not @user.following?(@ohter_user)
    assert_not @ohter_user.following?(@user)
    get root_path
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: { content: "@#{@ohter_user.userid} Hello World" }}
    end
    
    assert "@#{@ohter_user} Hello World", response.body

    delete user_path(@user)
    log_in_as(@ohter_user)
    assert is_logged_in?
    get root_path
    assert_template 'static_pages/home'
    assert "@#{@ohter_user.userid} Hello World", response.body
  end
end
