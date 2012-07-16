class UsersController < ApplicationController
  skip_before_filter :authenticate, :only => [:new, :create]
  def new
    @user = User.new
  end
  
  def create
    @user  = User.new(params[:user])
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end
end
