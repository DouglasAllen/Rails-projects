#---
# Excerpted from "Metaprogramming Ruby: Program Like the Ruby Pros",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr for more book information.
#---
# Create a new database each time
File.delete 'dbfile.db' if File.exist? 'dbfile.db'

require 'active_record'
ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                                        :database => "dbfile.db" 

# Initialize the database schema
ActiveRecord::Base.connection.create_table :ducks do |t|
   t.string  :name
end

class Duck < ActiveRecord::Base
  validates_length_of :name, :maximum => 6
end

my_duck = Duck.new
my_duck.name = "Donald"
p my_duck.valid?         # => true
my_duck.save!
puts Duck.all.inspect
some_duck = Duck.find(:first)
p some_duck.id           # => 1
p some_duck.name         # => "Donald"
some_duck.delete
puts Duck.all.inspect