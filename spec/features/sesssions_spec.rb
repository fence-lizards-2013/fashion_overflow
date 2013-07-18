require 'spec_helper'

describe "Sessions" do

  it "logs user in and redirects to home upon successful login" do
    this_user = User.create(username: "topher", password: "password")
    visit "/sessions/new"
    fill_in "username",    with: "topher"
    fill_in "password",  with: "password"
    click_button "Login"
    current_path.should eq "/users/#{this_user.id}"
  end

  it "displays errors on blank username" do
    visit "/sessions/new"
    fill_in "username",  with: ""
    fill_in "password",  with: "honey"
    click_button "Login"
    current_path.should eq sessions_path
    page.should have_content("An error occured, please try again.")
  end

  it "displays errors on blank password" do
    visit "/sessions/new"
    fill_in "username",  with: "topher"
    fill_in "password",  with: ""
    click_button "Login"
    current_path.should eq sessions_path
    page.should have_content("An error occured, please try again.")
  end

  it "displays errors with blank e-mail and blank password" do
    visit "/sessions/new"
    click_button "Login"
    current_path.should eq sessions_path
    page.should have_content("An error occured, please try again.")
  end

  it "displays errors with correct username, WRONG password" do
    this_user = User.create(username: "topher", password: "password")
    click_button "Login"
    current_path.should eq sessions_path
    page.should have_content("An error occured, please try again.")
  end
end
