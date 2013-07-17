class Crush < ActiveRecord::Base
  has_many :votes
  belongs_to :user

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
