class HomeController < ApplicationController
  skip_before_filter :logged_in

  def index
  end

  def clear
    render 'index', :layout => false
  end
end