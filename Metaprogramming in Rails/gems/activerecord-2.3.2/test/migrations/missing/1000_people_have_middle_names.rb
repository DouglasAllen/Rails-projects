#---
# Excerpted from "Metaprogramming Ruby: Program Like the Ruby Pros",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr for more book information.
#---
class PeopleHaveMiddleNames < ActiveRecord::Migration
  def self.up
    add_column "people", "middle_name", :string
  end

  def self.down
    remove_column "people", "middle_name"
  end
end