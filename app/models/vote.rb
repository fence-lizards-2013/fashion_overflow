class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :crush

  #validates_presence_of :up
  validates :up, inclusion: { in: [true, false] }

  attr_accessible :up
end
