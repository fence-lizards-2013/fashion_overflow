class SessionsController < ApplicationController
  def new
    @user = User.find_by_username(params[:username])
  end

  def create
    @user = User.find_by_username(params[:username])

    if @user && @user.authenticate(params[:password])
      login @user
      redirect_to user_url action: 'show', id: @user.id
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
  
