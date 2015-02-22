require "redis"

class RedisSub
  def self.subscribe(*channels, &block)
    Redis.new.subscribe(*channels, &block)
  end

  def self.psubscribe(*channels, &block)
    Redis.new.psubscribe(*channels, &block)
  end

end

