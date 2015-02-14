class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  validates_presence_of :first_name, :last_name

  def joe?
    first_name == "Joe"
  end
end
