require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:dragonborn) #users correspond to the fixture filename users.yml in test/fixtures
                               #fixtures is Rails way of organizing existing data in the db to be loaded into the test database
  end

  test "login with invalid info" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {sessions: {email: "asd", password:"321"}}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid info followed by logout" do
    get login_path
    post login_path, params: {sessions: {email: @user.email, password: "123456789"}}
    assert is_logged_in?
    assert_redirected_to @user            #to check right redirect target
    follow_redirect!                      #to actually visit the target page
    assert_template "users/show"
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)

    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    # Simulate a user clicking logout in a second window.
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0

  end
end
