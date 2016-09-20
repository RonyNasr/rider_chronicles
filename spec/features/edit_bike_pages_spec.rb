require "rails_helper"
include Warden::Test::Helpers

describe "the edit a bike process" do
  it "edits a bike" do
    user =FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    bike = Bike.create(:make => 'BMW', :user_id => user.id)
    visit edit_user_bike_path(user,bike)
    fill_in 'Make', :with => 'Honda'
    click_on 'Update Bike'
    expect(page).to have_content 'Honda'
  end

  it "gives error when no make is entered" do
    user =FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    bike = Bike.create(:make => 'BMW', :user_id => user.id)
    visit edit_user_bike_path(user,bike)
    fill_in 'Make', :with => ''
    click_button 'Update Bike'
    expect(page).to have_content 'errors'
  end
end
