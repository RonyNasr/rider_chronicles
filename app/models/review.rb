class Review < ActiveRecord::Base
  # before_save(set_defaults)

  validates :title, :presence => true
  belongs_to :user
  belongs_to :bike
private
  # def set_defaults
  #
  # end
end
