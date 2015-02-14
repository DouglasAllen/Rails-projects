require 'test_helper'

class PizzaTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Pizza.new.valid?
  end
end
