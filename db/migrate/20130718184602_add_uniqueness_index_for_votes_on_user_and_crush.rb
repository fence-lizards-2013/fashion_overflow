class AddUniquenessIndexForVotesOnUserAndCrush < ActiveRecord::Migration
  def change
    add_index :votes, [:user_id, :crush_id], :unique => true
  end
end
  
