class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_login
    redirect_to '/login' unless current_user
  end

  # Use this with require_login
  def require_admin
    if current_user.role != 'Admin'
      render :text => 'Not Found', :status => '404'
    end
  end
end
