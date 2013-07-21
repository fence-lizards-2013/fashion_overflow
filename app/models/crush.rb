class Crush < ActiveRecord::Base
  image_accessor :image

  has_many :votes

  belongs_to :user
  has_many :users_who_voted, :through => :votes, :source => :user

  validates_presence_of :url
  validates_presence_of :description

  attr_accessible :url, 
                  :description, 
                  :tags_attributes, 
                  :image, 
                  :retained_image, 
                  :image_url,
                  :image_uid,
                  :image_name


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

  def rank_votes(gravity = 1.8)
    # For a given crush
    # Find all votes
    # Points is the difference of upvotes and downvotes
    # Time is the difference between now and when the crush was created (in hours)
    # We fix gravity, but can override if necessary  
    points = self.aggregate
    time = ((Time.now - self.created_at) / 5760).round
    rank = (points - 1).to_f / ((time + 2)**gravity)
  end
end
