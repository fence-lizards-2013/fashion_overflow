class Vote < ActiveRecord::Base
  belongs_to :crush
  belongs_to :user
end
