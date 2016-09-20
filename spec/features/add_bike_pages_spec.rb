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
    visit new_user_bike_path(user)
    click_on 'Create Bike'
    expect(page).to have_content 'errors'
  end
end
