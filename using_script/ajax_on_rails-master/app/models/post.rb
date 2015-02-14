class Post < ActiveRecord::Base
  attr_accessible :content, :title

  validates :content, :title, :presence => true
end
