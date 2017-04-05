class UsersController < ApplicationController
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
end