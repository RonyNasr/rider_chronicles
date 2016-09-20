class Bike < ActiveRecord::Base
  validates :make, :presence => true
  belongs_to :user
  has_many :reviews
  has_attached_file :imageURL,  default_url: "/images/bikes/missing.png"
  validates_attachment_content_type :imageURL, content_type: /\Aimage\/.*\z/
end
