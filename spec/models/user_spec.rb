require 'spec_helper'

describe User do

  let(:username) { "Sample User" }
  let(:password) { "password" }
  let(:user) { User.create(username: username, password: password) }
  let(:crush) { create :crush }
  let(:vote) { create :vote, user: user, crush: crush, up: true }

  it "should require a username to create a user" do
    expect{ User.create!(username: "", password: password) }.to raise_error
  end

  it "should require a password to create a user" do
    expect{ User.create!(username: username, password: "") }.to raise_error
  end

  it "should ensure proper validation of name and password" do
    user.should be_valid
  end

  it "should create a user object when data is valid" do
    User.find(user.id).should eq user    
  end

  it "should not be valid if username is duplicate" do
    user
    User.create(username: username, password: password).should be_invalid
  end

  it "should find an existing user with a valid username and password" do
    
  end

  context "#upvoted_crushes" do
    it "should find the crushes that the user has upvoted" do
      crush.votes << vote
      expect(user.upvoted_crushes).to include crush
    end
  end

end
