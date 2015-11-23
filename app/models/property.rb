class Property < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :ratings, :as => :rateable

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
