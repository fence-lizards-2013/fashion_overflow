class UsersController < ApplicationController

  def index
    
  end

  def create
    @user = User.create(params[:user])
    redirect_to action: 'show', id: @user.id
  end


  def show
    @user = User.find(params[:id])
    
  end

  def new
    @user = User.new
    # redirect_to
  end
  
end
