class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def can_administer?
    true
  end

  helper_method :current_user, :can_administer?
end
