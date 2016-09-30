require "rails_helper"
include Warden::Test::Helpers

describe "the add bike process" do
  it "adds a new bike" do
    user =FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit user_path(user)
    click_link "New Bike"
    fill_in "Make", :with => "BMW"
    click_on 'Create Bike'
    expect(page).to have_content 'BMW'
  end

  it "gives error when no name is entered" do
    user =FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit user_path(user)
    click_link "New Bike"
    click_on 'Create Bike'
    expect(page).to have_content 'New Bike'
  end

    it "adds a bike from user page using AJAX", js: true do
      user =FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit user_path(user)
      click_link "New Bike"
      expect(page).to have_content "Make"
      fill_in "make", :with => "BMW"
      click_on 'Create Bike'
      expect(page).to have_content 'BMW'
    end

end
