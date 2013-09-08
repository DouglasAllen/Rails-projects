#---
# Excerpted from "Metaprogramming Ruby: Program Like the Ruby Pros",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr for more book information.
#---
module Rack
  class Lock
    FLAG = 'rack.multithread'.freeze

    def initialize(app, lock = Mutex.new)
      @app, @lock = app, lock
    end

    def call(env)
      old, env[FLAG] = env[FLAG], false
      @lock.synchronize { @app.call(env) }
    ensure
      env[FLAG] = old
    end
  end
end
