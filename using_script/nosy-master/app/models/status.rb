class Status < ActiveRecord::Base
  attr_accessible :text

  belongs_to :person

  def self.most_recent_by_person
    Person.all.map(&:latest_status).compact.sort_by(&:created_at).reverse
  end

  def self.all_by_recency
    order("created_at DESC").limit(100)
  end
end
