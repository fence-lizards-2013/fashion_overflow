require 'spec_helper'

describe Crush do
  let(:user)      { create :user }
  let(:crush)     { create :crush, :user => user }
  let(:up_vote)   { create :vote, :up }
  let(:down_vote) { create :vote, :down }

  context "validations" do
    it { should validate_presence_of :url }
    it { should validate_presence_of :description }
  end

  context "#up_votes" do
    it "should return the number of up_votes" do
      before = crush.voteable.size
      crush.voteable << up_vote
      after = crush.voteable.size
      expect(after).to eq(before+1)
    end
  end

  context "#down_votes" do

  end

  context "#aggregate" do

  end

end
