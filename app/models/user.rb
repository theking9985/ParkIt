class User < ActiveRecord::Base
  has_many :properties
  has_many :reservations
  has_many :ratings, :as => :rateable

  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false}

  validates :password,
  presence: true,
  length: {maximum: 99}

  validates :name,
  presence: true

  validates :phone,
  presence: true

  has_secure_password

  def self.authenticate(email, password)
    User.find_by_email(email).try(:authenticate, :password)
  end
end
