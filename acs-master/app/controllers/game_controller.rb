class GameController < ApplicationController
  before_filter :set_up_sse

  def events
    self.response_body = Enumerator.new do |y|
      begin
        loop do
          RedisSub.psubscribe("*") do |sub|
            sub.subscribe { |*args| STDERR.print "SUB: #{args.inspect}\n"}
            sub.unsubscribe { |*args| STDERR.print "UNSUB: #{args.inspect}\n"}
            sub.message { |*args| STDERR.print "MSG: #{args.inspect}\n"}
            sub.psubscribe { |*args| STDERR.print "PSUB: #{args.inspect}\n"}
            sub.punsubscribe { |*args| STDERR.print "PUNSUB: #{args.inspect}\n"}
            sub.pmessage do |*args|
              STDERR.print "PMSG: #{args.inspect}\n"
              y << sse_object({ :time => Time.now, :args => args.inspect })
            end
          end
        end
      rescue IOError
        # When the client disconnects, we'll get an IOError on write
      end
    end
  end

  protected

  def set_up_sse
    response.headers['Content-Type'] = 'text/event-stream'
    response.headers['Last-Modified'] = Time.now.to_s
    headers['Cache-Control'] = 'no-cache'
  end

  def sse_object(obj, options = {})
    options.map { |k,v| "#{k}: #{v}" }.join("\n") +
      "data: " + MultiJson.dump(obj) + "\n\n"
  end


end
