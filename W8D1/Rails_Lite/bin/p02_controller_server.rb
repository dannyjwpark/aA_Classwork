require 'rack'
require_relative '../lib/controller_base'

# class ControllerBase
#   attr_reader :req, :res
  
#   def initialize(req, res)
#     @req = req
#     @res = res
#   end

#   def render_content(content, content_type="text/html")
#     res['Content-Type'] = content_type
#     res.wirte(content)
#   end

#   def redirect_to(url='http://www.google.com')
#     res.header["Location"] = url
#     res.status = 302
#     # return value not needed
#     # return nil
#   end
# end


class MyController < ControllerBase
  
  def go
    if req.path == "/cats"
      render_content("hello cats!", "text/html")
    else
      redirect_to("/cats")
    end
  end


end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  MyController.new(req, res).go
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)

