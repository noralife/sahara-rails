class Order < ActiveRecord::Base
  belongs_to :customer 
  belongs_to :product
  validates :customer_id, presence: true
  validates :product_id,  presence: true
  validates :customer_id, numericality: true
  validates :product_id, numericality: true
end
