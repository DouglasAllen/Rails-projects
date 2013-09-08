#---
# Excerpted from "Metaprogramming Ruby: Program Like the Ruby Pros",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr for more book information.
#---
begin
  require_library_or_gem 'memcache'

  module ActionController
    module Session
      class MemCacheStore < AbstractStore
        def initialize(app, options = {})
          # Support old :expires option
          options[:expire_after] ||= options[:expires]

          super

          @default_options = {
            :namespace => 'rack:session',
            :memcache_server => 'localhost:11211'
          }.merge(@default_options)

          @pool = options[:cache] || MemCache.new(@default_options[:memcache_server], @default_options)
          unless @pool.servers.any? { |s| s.alive? }
            raise "#{self} unable to find server during initialization."
          end
          @mutex = Mutex.new

          super
        end

        private
          def get_session(env, sid)
            sid ||= generate_sid
            begin
              session = @pool.get(sid) || {}
            rescue MemCache::MemCacheError, Errno::ECONNREFUSED
              session = {}
            end
            [sid, session]
          end

          def set_session(env, sid, session_data)
            options = env['rack.session.options']
            expiry  = options[:expire_after] || 0
            @pool.set(sid, session_data, expiry)
            return true
          rescue MemCache::MemCacheError, Errno::ECONNREFUSED
            return false
          end
      end
    end
  end
rescue LoadError
  # MemCache wasn't available so neither can the store be
end
