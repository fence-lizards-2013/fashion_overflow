class Crush < ActiveRecord::Base
  image_accessor :image

  has_many :votes

  belongs_to :user
  has_many :users_who_voted, :through => :votes, :source => :user

  # validates_presence_of :url
  # validates_presence_of :description

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
end
