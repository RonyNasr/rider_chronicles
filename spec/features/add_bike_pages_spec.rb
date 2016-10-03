require "rails_helper"
include Warden::Test::Helpers

describe "the add bike process" do
    it "adds a bike from user page using AJAX", js: true do
      user =FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit user_path(user)
      click_link "New Bike"
      expect(page).to have_content "Make"
      fill_in "Make", :with => "BMW"
      click_on 'Create Bike'
      expect(page).to have_content 'BMW'
    end

    it "adds a bike from user page using AJAX", js: true do
      user =FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit user_path(user)
      click_link "New Bike"
      expect(page).to have_content "Make"
      fill_in "Make", :with => ""
      click_on 'Create Bike'
      expect(page).to have_content 'New Bike'
    end
end
