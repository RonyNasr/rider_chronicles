require 'rails_helper'

describe Review do
  it {should validate_presence_of :title}
  it {should belong_to :user}
  it {should belong_to :bike}
end
