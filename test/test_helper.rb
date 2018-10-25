ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Log in as a particular user.
  def log_in_as(user) # Inside controller tests, we can manipulate the session method directly
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest

  # Log in as a particular user.
  #Inside integration tests, we can’t manipulate session directly,
                # but we can post to the sessions path
  def log_in_as(user, password: '123456789', remember_me: '1')
    post login_path, params: { sessions: { email: user.email,
                                          password: password,
                                          remember_me: remember_me } }
  end
end
