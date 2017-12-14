require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:malory)
  end

  # test "index including pagination" do
  #   log_in_as(@user)
  #   get users_path    
  #   assert_template 'users/index'
  #   assert_select 'div.pagination'
  #   User.paginate(page: 1).each do |user|
  #     assert_select 'a[href=?]', user_path(user), text: user.name
  #   end
  # end

  test "index users all activated" do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      assert true, user.activated
    end
  end
end
