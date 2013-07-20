class VotesController < ApplicationController

  def new
    
  end

  def create
    up = params[:up] =~ /^t/ ? true : false
    @vote = Vote.new(:user_id => current_user.id, :crush_id => params[:crush_id], :up => up)
    if @vote.save
      render :json => { :new_count => up ? @vote.crush.up_votes.count : @vote.crush.down_votes.count }
    else
      render :json => {:success => false}, :status => :unprocessable_entity
    end

  end

end
