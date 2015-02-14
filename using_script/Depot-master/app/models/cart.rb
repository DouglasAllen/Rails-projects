class Cart < ActiveRecord::Base
  # attr_accessible :title, :body

  # Cart has one to many relationship with Line Item
  # Cart has many line items and it should allow to destroy that items
  has_many :line_items, dependent: :destroy

  # Method to add product.
  # Search from line_item table
  # If there is that item then increase it
  # otherwise build a new item
  def add_product(product_id)
  	current_item = line_items.find_by_product_id(product_id)
  	if current_item
  		current_item.quantity += 1
  	else
  		current_item = line_items.build(product_id: product_id)
     # current_item.price = current_item.product.price
     # current_item.save
  	end
  	current_item
  end

  # Method to calculate then total price
  def total_price
    line_items.to_a.sum { |item| item.total_price}  
  end
end
