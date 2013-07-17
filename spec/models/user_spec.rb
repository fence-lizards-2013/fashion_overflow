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

  it "should not be valid if username is duplicate" do
    user
    User.create(username: username, password: password).should be_invalid
  end

  it "should create a user in database when form is filled out correctly" do
    visit '/users/new'
    fill_in "user[username]", with: "Jeffrey"
    fill_in "user[password]", with: "password"
    click_button "Create User"
    User.find_by_username("Jeffrey").should be_true
  end
  
  it "should find an existing user with a valid username and password" do
    
  end

end
