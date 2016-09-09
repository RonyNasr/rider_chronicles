class Bike < ActiveRecord::Base
  validates :make, :presence => true
  belongs_to :user
  has_many :reviews
end
