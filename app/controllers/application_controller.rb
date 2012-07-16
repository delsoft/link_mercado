require_dependency 'authentication_system'

class ApplicationController < ActionController::Base
  include AuthenticationSystem
  protect_from_forgery
  
  before_filter :authenticate
  
end
