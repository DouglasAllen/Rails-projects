class StoreController < ApplicationController

	skip_before_filter :authorize
	
  def index
  	if params[:set_locale]
  		redirect_to store_path(locale: params[:set_locale])
  	else
     # Product to display index page
  		@products = Product.order(:title)
  		#@products = Product.all
  		@cart = current_cart
  	end
  end
end
