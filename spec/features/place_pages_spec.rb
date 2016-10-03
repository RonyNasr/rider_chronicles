require "rails_helper"
include Warden::Test::Helpers

describe "the add place process" do
  it "adds a new place" do
    user =FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit user_path(user)
    click_link "My Places"
    click_link "New Place"
    fill_in "Name", :with => "Epicodus"
    fill_in "Address", :with => "400 SW 6th Ave #800, Portland, OR 97204"
    click_on 'Create Place'
    expect(page).to have_content 'Epicodus'
  end


    it "gives error if address is empty" do
      user =FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit user_path(user)
      click_link "My Places"
      click_link "New Place"
      fill_in "Name", :with => "Epicodus"
      fill_in "Address", :with => ""
      click_on 'Create Place'
      expect(page).to have_content 'error'
    end
end
