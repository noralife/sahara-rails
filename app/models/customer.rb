class Customer < ActiveRecord::Base
  has_many :orders
  validates :name,     presence: true
  validates :email,    presence: true
  validates :password, presence: true
  validates :email,    uniqueness: true
end
