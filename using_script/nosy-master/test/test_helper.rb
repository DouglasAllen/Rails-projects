ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'mocha/setup'

FactoryGirl.define do
  factory :person do
    name "Joe"
    email "joe@example.com"
  end

  factory :status do
    person
    created_at { Time.zone.now }
  end
end

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

class ActionController::TestCase
  include FactoryGirl::Syntax::Methods
end
