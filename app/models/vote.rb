class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :crush

  validates :up, inclusion: { in: [true, false] }

  attr_accessible :up, :user_id, :crush_id
end
