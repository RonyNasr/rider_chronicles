class Place < ActiveRecord::Base
  belongs_to :user

  validates :address, :presence => true

  geocoded_by :address
  after_validation :geocode
end
