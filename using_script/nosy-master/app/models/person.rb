class Person < ActiveRecord::Base
  attr_accessible :name, :email, :campfire_subdomain, :campfire_token, :campfire_room

  has_many :statuses

  before_create :generate_token

  def latest_status
    statuses.order("created_at DESC").first
  end

  def self.authenticate(token)
    Person.where(token: token).first
  end

  private

  def generate_token
    self.token = SecureRandom.hex(4)
  end
end
