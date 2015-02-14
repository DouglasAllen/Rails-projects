class Pizza < ActiveRecord::Base
  belongs_to :crust_type
  belongs_to :user
  
  attr_accessible :name, :crispy, :crust_type_id
  
  def description
    descriptions = []
    descriptions << "#{crust_type.name} Crust" if crust_type
    descriptions << "Extra Crispy" if crispy?
    descriptions.join(', ')
  end
end
