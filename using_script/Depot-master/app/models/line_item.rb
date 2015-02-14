class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id

  # Cart has one to many relationship with Line item
  # Line Item belongs to cart reference to cart_id (i.e foreign key)
  belongs_to :cart

  # Line Item belongs to product reference to product_id
  belongs_to :product
  
  # Line item belongs to order 
  # order_id is add in table through migration
  belongs_to :order

  # calculate total price 
  def total_price
  	product.price * quantity  	
  end
  
end
