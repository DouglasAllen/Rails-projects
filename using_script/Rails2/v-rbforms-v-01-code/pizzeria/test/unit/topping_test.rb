require 'test_helper'

class ToppingTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Topping.new.valid?
  end
end
