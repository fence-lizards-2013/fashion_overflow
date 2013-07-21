class CrushesController < ApplicationController

  def index
    # crushes = Crush.all
    # @sorted_crushes = crushes.sort_by { |crush| crush.aggregate }.reverse
    @current_user = current_user
    #  @sorted_crushes.page(params[:page]).per(2)
    @sorted_crushes = Crush.order("description").page(params[:page]).per(3)

  end

  def create
    @crush = Crush.new(params[:crush])
    @crush.user = current_user
    if @crush.save
      redirect_to root_path
    else
      flash[:error] = "Oops, something went wrong. Please try again."
      redirect_to new_crush_path
    end
    
  end

  def show
    @crush = Crush.find(params[:id])
    @current_user = current_user
    crush_path
  end

  def new
    @crush = Crush.new
  end

  def edit
    @crush = Crush.find(params[:id])
  end

  def update
    @crush = Crush.find(params[:id])
    @crush.update_attributes(params[:crush])
    if @crush.save
      redirect_to crush_path(@crush)
    else

    end
  end
  
  def destroy
    Crush.destroy(params[:id])
    redirect_to root_path
  end

end

