#encoding: utf-8
class SessionsController < ApplicationController
skip_before_filter :authenticate, :only => [:create, :destroy]

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to root_path, notice: "Email ou senha inválidos"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
