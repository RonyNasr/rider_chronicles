require 'rails_helper'

RSpec.describe "places/edit", type: :view do
  before(:each) do
    @place = assign(:place, Place.create!(
      :lattitude => 1.5,
      :longitude => 1.5,
      :name => "MyString",
      :address => "MyString"
    ))
  end

  it "renders the edit place form" do
    render

    assert_select "form[action=?][method=?]", place_path(@place), "post" do

      assert_select "input#place_lattitude[name=?]", "place[lattitude]"

      assert_select "input#place_longitude[name=?]", "place[longitude]"

      assert_select "input#place_name[name=?]", "place[name]"

      assert_select "input#place_address[name=?]", "place[address]"
    end
  end
end
