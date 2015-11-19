class User < ActiveRecord::Base
  has_many :properties
  has_many :reservations
  has_many :ratings, :as => :rateable
end
