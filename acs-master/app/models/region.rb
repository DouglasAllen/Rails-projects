class Region < ActiveRecord::Base
  belongs_to :world
  has_many :rooms

  include TextTransform

  def to_param
    id_and_name_to_param(id, name)
  end
end
