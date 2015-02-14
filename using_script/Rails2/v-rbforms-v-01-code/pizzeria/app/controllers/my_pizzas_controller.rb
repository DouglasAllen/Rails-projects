class MyPizzasController < ApplicationController
  before_filter :login_required
  
  def index
    @pizzas = current_user.pizzas
  end
end
