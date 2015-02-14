class AdminController < ApplicationController
  def index
  	# Displayd total order in index page
  	@total_orders = Order.count
  end
end
