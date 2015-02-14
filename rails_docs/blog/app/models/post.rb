class Post < ActiveRecord::Base
  validates :name,  :presence => true
  validates :title, :presence => true, :length => { :minimum => 5 }

  # my edited inserts
  has_many :comments
end