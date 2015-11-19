class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  belongs_to :rateable_type, polymorphic: true
end
