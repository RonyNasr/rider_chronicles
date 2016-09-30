require 'rails_helper'

RSpec.describe "places/index", type: :view do
  before(:each) do
    assign(:places, [
      Place.create!(
        :lattitude => 2.5,
        :longitude => 3.5,
        :name => "Name",
        :address => "Address"
      ),
      Place.create!(
        :lattitude => 2.5,
        :longitude => 3.5,
        :name => "Name",
        :address => "Address"
      )
    ])
  end

  it "renders a list of places" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
  end
end
