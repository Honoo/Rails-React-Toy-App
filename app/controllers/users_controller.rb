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
    current_user = get_current_user()
    if current_user.id == params[:id].to_i || current_user.role.name == "Admin"
      @user = User.find(params[:id])
      @title = "User " + params[:id]
      render :show
    else
      render :text => 'Not Found', :status => '404'
    end
  end

  def new
    @title = "Signup"
    render :new
  end

  def create
    user = User.new(user_params)
    user.role_id = Role.find_by_name("User").id
    if user.save
      session[:user_id] = user.id
      redirect_to '/users/' + user.id.to_s
    else
      redirect_to '/signup'
    end
  end

  def update
    if params[:id]
      user = User.find(params[:id])
      if user.update_attributes!(user_params)
        render :nothing => true, status: :ok
      else
        render :nothing => true, status: :bad_request
      end
    else
      render :nothing => true, status: :bad_request
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end