class Terrain < ActiveRecord::Base
  belongs_to :terrain_set
  belongs_to :game_image
end
