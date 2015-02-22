require "socket"

class GameStatus
  def self.update(world_id)
    status = ServerStatus.find_or_create_by_world_id(world_id)
    if !status
      STDERR.puts "Error creating server status for world ID #{world_id}!"
      exit -4
    end

    status.server_host = Socket.gethostname
    status.server_host_will_change!  # Set dirty bit
    status.save!
  end

end
