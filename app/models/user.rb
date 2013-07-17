class User < ActiveRecord::Base
  # has_many :crushes
  has_secure_password
end
