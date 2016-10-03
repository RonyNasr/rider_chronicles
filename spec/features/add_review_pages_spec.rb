require "rails_helper"
include Warden::Test::Helpers

describe "the add review process" do
  it "adds a review from bike page using AJAX", js: true do
    bike = FactoryGirl.create(:bike)
    login_as(bike.user, :scope => :user)
    visit user_bike_path(bike.user,bike)
    click_link "Add Review"
    expect(page).to have_content "Title"
    fill_in "Title", :with => "WOW"
    click_on 'add Comment'
    expect(page).to have_content 'WOW'
  end

  it "fails to add a review from bike page using AJAX if title is empty", js: true do
    bike = FactoryGirl.create(:bike)
    login_as(bike.user, :scope => :user)
    visit user_bike_path(bike.user,bike)
    click_link "Add Review"
    expect(page).to have_content "Title"
    fill_in "Title", :with => ""
    click_on 'add Comment'
    expect(page).to have_content 'Add Review'
  end
end
