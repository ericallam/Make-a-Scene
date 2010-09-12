ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'factories'

class ActiveSupport::TestCase
  
end

class ActionController::TestCase
  include Devise::TestHelpers
end

class ActionDispatch::IntegrationTest
  
  def sign_in(admin)
    get new_admin_session_path
    assert_equal 200, status
    
    post admin_session_path, :admin => { :email => admin.email, :password => admin.password }
    follow_redirect!
  end
  
end
