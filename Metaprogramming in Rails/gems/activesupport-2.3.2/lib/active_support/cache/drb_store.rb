#---
# Excerpted from "Metaprogramming Ruby: Program Like the Ruby Pros",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr for more book information.
#---
module ActiveSupport
  module Cache
    class DRbStore < MemoryStore #:nodoc:
      attr_reader :address

      def initialize(address = 'druby://localhost:9192')
        require 'drb' unless defined?(DRbObject)
        super()
        @address = address
        @data = DRbObject.new(nil, address)
      end
    end
  end
end
