class Comment < ActiveRecord::Base
  # my edited inserts
  validates :commenter, :presence => true
  validates :body, :presence => true

  belongs_to :post
end
