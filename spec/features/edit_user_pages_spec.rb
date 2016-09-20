require "rails_helper"
include Warden::Test::Helpers

describe "the add user process" do
  it "Edit a user" do
    user =FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit user_path(user)
    click_link "Edit User"
    fill_in "Name", :with => "Jones"
    fill_in "password", :with => "123456"
    click_on 'Update'
    expect(page).to have_content 'Jones'
  end

  it "gives error when no name is entered" do
    user =FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit user_path(user)
    click_link "Edit User"
    fill_in "Name", :with => ""
    # fill_in "password", :with => "123456"
    click_on 'Update'
    expect(page).to have_content 'errors'
  end
end
