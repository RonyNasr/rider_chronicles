class Review < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :user
  belongs_to :bike
end
