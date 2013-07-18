require 'spec_helper'
describe "Login" do

  it "should create a user in database when form is filled out correctly" do
    visit new_user_url
    fill_in "user[username]", with: "Jeffrey"
    fill_in "user[password]", with: "password"
    click_button "Create User"
    User.find_by_username("Jeffrey").should be_true
  end

end
  
