class Crush < ActiveRecord::Base
  has_many :votes
  # has_many :up_votes,   :class_name => 'Vote', :conditions => {:up => true}
  # has_many :down_votes, :class_name => 'Vote', :conditions => {:up => false}

  belongs_to :user
  has_many :users_who_voted, :through => :votes, :source => :user

  validates_presence_of :url
  validates_presence_of :description

  attr_accessible :url, :description, :tags_attributes


  def up_votes
    votes.select{|vote| vote.up }
  end

  def down_votes
    votes.reject{|vote| vote.up }
  end

  def aggregate
    up   = self.up_votes.size
    down = self.down_votes.size
    up - down
  end
end
