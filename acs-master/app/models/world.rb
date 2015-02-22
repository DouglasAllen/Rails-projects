require "text_transform"

class World < ActiveRecord::Base
  include TextTransform

  has_one :server_status
  has_many :regions

  def to_param
    id_and_name_to_param(id, name)
  end
end
