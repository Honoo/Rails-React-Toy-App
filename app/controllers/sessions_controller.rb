# Controller for logins.

class SessionsController < ApplicationController
  def new
    @title = "Login"
    render :new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/users/' + user.id.to_s
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end
end