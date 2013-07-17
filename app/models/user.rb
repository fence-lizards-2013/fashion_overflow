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
  attr_accessible :username, :password
  has_many :crushes
  has_many :votes
  validates :username, presence: true
  validates :username, uniqueness: true
  has_secure_password
end
