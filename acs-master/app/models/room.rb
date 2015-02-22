class Room < ActiveRecord::Base
  belongs_to :region

  include TextTransform

  def to_param
    id_and_name_to_param(id, name)
  end
end
