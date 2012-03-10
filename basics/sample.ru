require "time"

class RenderingTime
  def initialize(app)
    @app = app
  end

  def call(env)
    start = Time.now
    status, headers, body = @app.call(env)
    elapsed = Time.now - start
    headers["X-RenderingTime"] = elapsed.to_s

    [status, headers, body]
  end
end

use RenderingTime
use Rack::Lint
run proc {|env| [200, {"Content-Type" => "text/html"},["Hello world!"]]}
