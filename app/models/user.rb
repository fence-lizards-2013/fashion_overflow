# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_many :crushes
  has_many :votes
  has_many :crushes_voted_on, :through => :votes, :source => :crush

  attr_accessible :username, :password

  validates :username, presence: true
  validates :username, uniqueness: true
  has_secure_password

  def upvoted_crushes
    votes.where(up: true).map { |vote| vote.crush }
  end

end
