class Crush < ActiveRecord::Base
  has_many :votes
  belongs_to :user
  has_many :users_who_voted, :through => :votes, :source => :user

  validates_presence_of :url
  validates_presence_of :description

  def up_votes
    self.voteable.where(up: true)
  end

  def down_votes
    self.voteable.where(up: false)
  end

  def aggregate
    up   = self.up_votes.size
    down = self.down_votes.size
    up - down
  end
end
