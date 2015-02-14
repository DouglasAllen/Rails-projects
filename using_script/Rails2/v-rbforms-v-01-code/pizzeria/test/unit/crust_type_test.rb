require 'test_helper'

class CrustTypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert CrustType.new.valid?
  end
end
