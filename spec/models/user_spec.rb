require 'spec_helper'

describe User do

  let(:username) { "Sample User" }
  let(:password) { "password" }
  let(:user) { User.create(username: username, password: password) }

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
end
