require 'test_helper'

class PizzaToppingTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PizzaTopping.new.valid?
  end
end
