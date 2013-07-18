class CrushesController < ApplicationController

  def index
    @crushes = Crush.all
    @current_user = current_user
  end

  def create

  end

  def show

  end

  def new
    # redirect_to
  end
  
end

