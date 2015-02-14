class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :pay_types

  # Payment types in array
  PAYMENT_TYPES = ["Check", "Credit cart", "Purchase order"]

  # Name , address and email must be present
  validates :name, :address, :email, presence: true

  # Payment must be include
  validates :pay_types, inclusion: PAYMENT_TYPES

  # Order has many line items
  has_many :line_items

  # Ensure that if there is product in cart then it must be added in line item
  def add_line_items_from_cart(cart)
  	cart.line_items.each do |item|
  		item.cart_id = nil
  		line_items << item
  	end      	
  end
end
