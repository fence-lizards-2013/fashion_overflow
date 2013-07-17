class Vote < ActiveRecord::Base
  belongs_to :crush
  belongs_to :user

  attr_accessible :up
end
