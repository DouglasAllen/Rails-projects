class HousePizzasController < ApplicationController
  def index
    @pizzas = Pizza.find_all_by_user_id(nil)
  end
end
