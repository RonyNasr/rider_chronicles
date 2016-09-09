require 'rails_helper'

describe Bike do
  it {should validate_presence_of :make}
  it {should belong_to :user}
  it {should have_many :reviews}
end
