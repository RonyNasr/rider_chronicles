require "rails_helper"
include Warden::Test::Helpers

describe "the add user process" do
  it "adds a new user" do
    visit new_user_registration_path
    fill_in "Name", :with => "Jack"
    fill_in "signup_email", :with => "Jack@example.com"
    fill_in "signup_password", :with => "123456"
    fill_in "Password confirmation", :with => "123456"
    click_on 'Sign up'
    expect(page).to have_content 'Jack'
  end

  it "gives error when no name is entered" do
    visit root_path
    click_on 'Sign up'
    expect(page).to have_content 'errors'
  end
end


describe "logging in a user" do
  it "logs in a user" do
    FactoryGirl.create(:user)
    visit root_path
    fill_in "login_email", :with => 'Jack@example.com'
    fill_in "login_password", :with => "123456"
    click_on "Log in"
    expect(page).to have_content('Jack')
  end
end


describe "logging out a user" do
  it "logs out a user" do
    FactoryGirl.create(:user)
    visit root_path
    fill_in "login_email", :with => 'Jack@example.com'
    fill_in "login_password", :with => "123456"
    click_on "Log in"
    click_on "Sign Out"
    expect(page).to have_content('Sign up')
  end
end
