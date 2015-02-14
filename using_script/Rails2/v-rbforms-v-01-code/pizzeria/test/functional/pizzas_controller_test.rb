require 'test_helper'

class PizzasControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Pizza.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Pizza.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Pizza.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to pizza_url(assigns(:pizza))
  end
  
  def test_edit
    get :edit, :id => Pizza.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Pizza.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Pizza.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Pizza.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Pizza.first
    assert_redirected_to pizza_url(assigns(:pizza))
  end
  
  def test_destroy
    pizza = Pizza.first
    delete :destroy, :id => pizza
    assert_redirected_to pizzas_url
    assert !Pizza.exists?(pizza.id)
  end
end
