class CrushesController < ApplicationController

  def index
    crushes = Crush.all
    #Execute rank_votes of crushes and return @sorted_crushes
    @sorted_crushes = crushes.sort {|c1, c2| c1.rank_votes <=> c2.rank_votes}.reverse
    # @sorted_crushes = crushes.sort_by { |crush| crush.aggregate }.reverse #Old
    @current_user = current_user
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
      flash[:error] = "Oops, something went wrong. Please try again."
      redirect_to crush_path
    end
  end
  
  def destroy
    Crush.destroy(params[:id])
    redirect_to root_path
  end

end

