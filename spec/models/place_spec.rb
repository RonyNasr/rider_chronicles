require 'rails_helper'

describe Place do
  it {should belong_to :user}
  it {should validate_presence_of :address}
end
