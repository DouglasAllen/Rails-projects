# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

run DemoApp::Application



app = Rack::Builder.new do
  
  use Rack::Reloader
  map '/' do
    # This is the root of our app
    @root = File.expand_path(File.dirname(__FILE__))
    run lambda {|env| Rack::Directory.new(@root).call(env)} 
  end

  class Site
    def self.call(env)
      [200, { "Content-Type" => "text/html" }, ["#{env}"]]
    end
  end

  map '/lost' do
    run Site
  end
 
end.to_app

run app