class VotesController < ApplicationController

  def new
    
  end

  def create 
    p params
    @vote = Vote.new(:user_id => current_user.id, :crush_id => params[:crush_id], :up => params[:up])
    if @vote.save
      render :json => {:up_votes => @vote.crush.up_votes.count, :down_votes => @vote.crush.down_votes.count}
    else
      render :json => {:success => false}
    end

  end

end
