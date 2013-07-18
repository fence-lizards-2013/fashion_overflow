class Crush < ActiveRecord::Base
  has_many :votes
  belongs_to :user
  has_many :users_who_voted, :through => :votes, :source => :user

  validates_presence_of :url
  validates_presence_of :description

  attr_accessible :url, :description, :tags_attributes

  def up_votes
    self.votes.where(up: true)
  end

  def down_votes
    self.votes.where(up: false)
  end

  def aggregate
    up   = self.up_votes.size
    down = self.down_votes.size
    up - down
  end
end
