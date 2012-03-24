class SessionsController < ApplicationController
  skip_before_filter :logged_in

  def index
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :controller => "admin"
    else
      flash.now.alert = "Invalid username or password"
      render "index"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
