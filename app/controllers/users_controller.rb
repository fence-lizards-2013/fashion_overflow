class UsersController < ApplicationController

  def index
    
  end

  def create
    @user = User.create(params[:user])
    login(@user)
    redirect_to root_path
    # redirect_to session_url action: 'new' 
    puts "Users#create"
  end


  def show
    @user = User.find(params[:id])
    
  end

  def new
    @user = User.new
    # redirect_to
  end

  
  
end
