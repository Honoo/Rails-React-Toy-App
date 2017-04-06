class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :get_current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user != nil
  end

  def get_current_user
    return current_user
  end

  def require_login
    redirect_to '/login' unless current_user
  end

  def require_admin
    if current_user.role.name != 'Admin'
      render :text => 'Not Found', :status => '404'
    end
  end
end
