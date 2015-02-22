require "redis"

class RedisPub
  def self.connection
    return @connection if @connection

    @connection ||= Redis.new
  end

  # TODO: don't make this return connected forever
  def self.connected?(check_again = false)
    conn = self.connection

    if check_again
      @is_connected = nil
      @checked_connected = nil
    end

    return @is_connected if @checked_connected

    @checked_connected = true
    begin
      @is_connected = true
      conn.publish("none", "none")
    rescue Redis::CannotConnectError
    end
  end

  def self.publish(channel, message)
    connection.publish(channel, message)
  end

end
