class TerrainSet < ActiveRecord::Base
  has_many :terrains

  accepts_nested_attributes_for :terrains,
    :reject_if => proc { |attrs|
      [ attrs[:passibility], attrs[:game_image_id], attrs[:name] ].all? do |v|
        v.nil? || v.empty?
      end
    }
end
