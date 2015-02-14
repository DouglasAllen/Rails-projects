class PizzasController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  
  def index
    @pizzas = Pizza.find(:all)
  end
  
  def show
    @pizza = Pizza.find(params[:id])
  end
  
  def new
    @pizza = current_user.pizzas.build
    @pizza.crust_type = CrustType.find_by_name('Normal')
  end
  
  def create
    @pizza = current_user.pizzas.build(params[:pizza])
    if @pizza.save
      flash[:notice] = "Successfully created pizza."
      redirect_to my_pizzas_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @pizza = current_user.pizzas.find(params[:id])
  end
  
  def update
    @pizza = current_user.pizzas.find(params[:id])
    if @pizza.update_attributes(params[:pizza])
      flash[:notice] = "Successfully updated pizza."
      redirect_to my_pizzas_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @pizza = current_user.pizzas.find(params[:id])
    @pizza.destroy
    flash[:notice] = "Successfully destroyed pizza."
    redirect_to my_pizzas_url
  end
end
