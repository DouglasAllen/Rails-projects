class ResponseTimer

  def initialize(app)
    @pp = app
  end
  
  def call(env)
    [200, {"Content-Type" => "text/html"}, "Hello World!"]
  end

end