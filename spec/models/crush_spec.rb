require 'spec_helper'

describe Crush do
  let(:user)               { create :user }
  let(:crush)              { create :crush, :user => user }
  let(:crush_with_votes)   { create :crush_with_votes }
  let(:up_vote)            { create :vote, :up => true, :crush => nil }
  let(:down_vote)          { create :vote, :up => false, :crush => nil }

  context "validations" do
    it { should validate_presence_of :url }
    it { should validate_presence_of :description }
  end

  context "#up_votes" do
    it "should return the number of up_votes" do
      before_val = crush.votes.size
      crush.votes << up_vote
      after_val = crush.votes.size
      expect(after_val).to eq(before_val+1)
    end
  end

  context "#down_votes" do
    it "should return the number of down_votes" do
      before_val = crush.votes.size
      crush.votes << down_vote
      after_val = crush.votes.size
      expect(after_val).to eq(before_val+1)
    end
  end

  context "#aggregate" do
    it "should return the difference of up_votes and down_votes" do
      crush.votes << up_vote
      expect( crush.aggregate ).to eq(1)
    end
  end

  context "#rank_votes" do
    it "should calculate a voting rank" do
      expect(crush.rank_votes).to be_a(Float)
    end
  end

end
