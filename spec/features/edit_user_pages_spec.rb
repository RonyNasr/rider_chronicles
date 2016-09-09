require "rails_helper"

describe "the add user process" do
  it "Edit a user" do
    user = User.create(:name => 'Jack')
    visit user_path(user)
    click_link "Edit User"
    fill_in "Name", :with => "Jones"
    click_on 'Update User'
    expect(page).to have_content 'Jones'
  end

  it "gives error when no name is entered" do
    user = User.create(:name => 'Jack')
    visit user_path(user)
    click_link "Edit User"
    fill_in "Name", :with => ""
    click_on 'Update User'
    expect(page).to have_content 'errors'
  end
end
