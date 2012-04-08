class UsersController < ApplicationController
  #before_filter :authenticate_user!
  def index
    @users = User.find(:all, :order =>'name')
  end
  def show
    @user = User.find(params[:id])
  end
end
