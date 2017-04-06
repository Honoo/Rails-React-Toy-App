# Controller for user profiles.

class UsersController < ApplicationController
  before_action :require_login, only: [:index, :show]
  before_action :require_admin, only: [:index]

  def index
    @title = "Users"
    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    @title = "User " + params[:id].to_s
    render :show
  end

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/users/' + user.id.to_s
    else
      redirect_to '/signup'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end