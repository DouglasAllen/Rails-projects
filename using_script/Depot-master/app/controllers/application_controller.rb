class ApplicationController < ActionController::Base
  protect_from_forgery

  # filter for authorization
  before_filter :authorize

  # filter for internationzation
  before_filter :set_i18n_locale_from_params

  protected
  # Method to give authorization
  # If there is not user then redirect to login page
  def authorize
  	unless User.find_by_id(session[:user_id])
  		redirect_to login_url, notice: "Please Log in"
  	end  	
  end

  # Method to set availabe internationzation 
  # If internationzation is available then it should it
  # otherwise producee errors 
  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translation not availabe"

        # when internatizaton is not availabe then display error
        logger.error flash.now[:notice]
      end
    end    
  end

  # method to set default internatization
  def default_url_options
    { locale: I18n.locale}    
  end

  # Method to find current cart.
  
  private

  def current_cart 
    # Find card as per session
  	Cart.find(session[:cart_id])

    # handle the exception RecordNot Found
  rescue ActiveRecord::RecordNotFound

    # Create Cart
  	cart = Cart.create
  	session[:cart_id] = cart.id 
  	cart  	
  end
end
