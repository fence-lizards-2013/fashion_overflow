class VotesController < ApplicationController

  def new
    
  end

  def create
    up = params[:up] =~ /^t/ ? true : false
    @vote = Vote.new(:user_id => current_user.id, :crush_id => params[:crush_id], :up => up)
    if @vote.save
      up_votes = @vote.crush.up_votes.count
      down_votes = @vote.crush.down_votes.count
      render :json => { :aggregate => up_votes - down_votes, :up_votes => up_votes, :down_votes => down_votes, :id => crush.id }
    else
      render :json => {:success => false}, :status => :unprocessable_entity
    end
  end
end
