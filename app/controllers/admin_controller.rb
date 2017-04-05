class AdminController < ApplicationController
  def index
    @title = "Users"
    @users = User.all
    render :index
  end
end