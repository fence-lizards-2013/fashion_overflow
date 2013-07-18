require 'spec_helper'
require 'pry'

describe Crush do
  let(:user)              { create :user }
  let(:crush)             { create :crush, :user => user }
  let!(:crush_with_votes)  { create :crush_with_votes}
  let(:up_vote)           { create :vote, :up }
  let(:down_vote)         { create :vote, :down }

  context "validations" do
    it { should validate_presence_of :url }
    it { should validate_presence_of :description }
  end

  context "#up_votes" do
    it "should return the number of up_votes" do
      votes_before = crush_with_votes.up_votes.size
      binding.pry
      crush_with_votes.votes << up_vote
      crush_with_votes.save
      binding.pry
      votes_after = crush_with_votes.up_votes.size
      binding.pry
      expect(votes_after).to eq(1 + votes_before)
      # votes_before = crush_with_votes.votes.size
      # crush_with_votes.votes << up_vote
      # votes_after = crush_with_votes.votes.size
      # expect(votes_after).to eq(votes_before + 1)
    end
  end

  context "#down_votes" do

  end

  context "#aggregate" do

  end

end
