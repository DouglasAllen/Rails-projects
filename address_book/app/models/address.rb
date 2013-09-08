class Address < ActiveRecord::Base
  attr_accessible :city, :person_id, :street, :zip
end
