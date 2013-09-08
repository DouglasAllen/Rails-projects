#!/usr/bin/env ruby
#---
# Excerpted from "Metaprogramming Ruby: Program Like the Ruby Pros",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr for more book information.
#---

# We are defining method_added in Kernel and Object so that when
# BlankSlate overrides them later, we can verify that it correctly
# calls the older hooks.

module Kernel
  class << self
    attr_reader :k_added_names
    alias_method :preload_method_added, :method_added
    def method_added(name)
      preload_method_added(name)
      @k_added_names ||= []
      @k_added_names << name
    end
  end
end

class Object
  class << self
    attr_reader :o_added_names
    alias_method :preload_method_added, :method_added
    def method_added(name)
      preload_method_added(name)
      @o_added_names ||= []
      @o_added_names << name
    end
  end
end
