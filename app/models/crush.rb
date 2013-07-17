class Crush < ActiveRecord::Base
  has_many :votes
  belongs_to :user

  def up_votes
    self.votes.find_by_up(true).size
  end

  def down_votes
    self.votes.find_by_up(false).size
  end

  def aggregate
    self.up_votes - self.down_votes
  end
end
