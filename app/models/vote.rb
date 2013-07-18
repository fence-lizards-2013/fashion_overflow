class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :crush
  
  validates :up, inclusion: { in: [true, false] }
  validates :user_id, :uniqueness => {:scope => :crush_id}
  attr_accessible :up, :user_id, :crush_id
end
