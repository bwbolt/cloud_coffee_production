class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email

  has_many :lots
  has_many :logs, through: :lots
  has_many :current_products
  has_many :order_requests
  has_many :blends
  has_many :blend_logs, through: :blends
  

 



end
