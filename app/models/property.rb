class Property < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :ratings, :as => :rateable
end
