class GameImage < ActiveRecord::Base
  mount_uploader :image_data, ImageUploader
end
