#---
# Excerpted from "Metaprogramming Ruby: Program Like the Ruby Pros",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr for more book information.
#---
class Category < ActiveRecord::Base
  has_and_belongs_to_many :posts
  has_and_belongs_to_many :special_posts, :class_name => "Post"
  has_and_belongs_to_many :other_posts, :class_name => "Post"
  has_and_belongs_to_many :posts_with_authors_sorted_by_author_id, :class_name => "Post", :include => :authors, :order => "authors.id"

  has_and_belongs_to_many(:select_testing_posts,
                          :class_name => 'Post',
                          :foreign_key => 'category_id',
                          :association_foreign_key => 'post_id',
                          :select => 'posts.*, 1 as correctness_marker')

  has_and_belongs_to_many :post_with_conditions,
                          :class_name => 'Post',
                          :conditions => { :title => 'Yet Another Testing Title' }

  has_and_belongs_to_many :popular_grouped_posts, :class_name => "Post", :group => "posts.type", :having => "sum(comments.post_id) > 2", :include => :comments
  has_and_belongs_to_many :posts_gruoped_by_title, :class_name => "Post", :group => "title", :select => "title"

  def self.what_are_you
    'a category...'
  end

  has_many :categorizations
  has_many :authors, :through => :categorizations, :select => 'authors.*, categorizations.post_id'
end

class SpecialCategory < Category

  def self.what_are_you
    'a special category...'
  end

end
