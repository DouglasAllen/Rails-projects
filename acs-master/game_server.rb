#!/usr/bin/env rails runner
# Runner will work when Rails 4.0 is released, not pre-production

$LOAD_PATH.prepend File.join(File.dirname(__FILE__), "lib", "game")
require "status"

if ARGV.size != 1
  STDERR.puts "Usage: game_server.rb <world_id>"
  exit -2
end

world_id = ARGV.first.to_i

world = World.find(world_id)
if !world
  STDERR.puts "Could not find world with ID #{world_id}!"
  exit -3
end

require "redis"

Thread.new do
  RedisSub.psubscribe("*") do |sub|
    sub.pmessage do |*args|
      STDERR.puts "GAMESRV: PMSG: #{args}"
    end
  end
end

iter = 0

loop do
  GameStatus.update(world.id)

  RedisPub.publish("clock", "Iteration: #{iter}")
  sleep 1

  iter += 1
end
puts "Finished trivial update successfully."
