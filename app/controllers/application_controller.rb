class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :logged_in

  private

  def logged_in
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    redirect_to "/login" if !@current_user
  end

  helper_method :logged_in
end
