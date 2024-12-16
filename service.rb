require 'rack'
require 'logger'
require 'net/http'
require 'uri'

class Service
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    user_id = request.get_header('HTTP_X_C6O_USERID')
    logger = Logger.new(STDOUT)
    logger.info("Request from #{request.ip}, userID=#{user_id}")

    begin
      uri = URI.parse("http://service-c:8080/")
      http = Net::HTTP.new(uri.host, uri.port)
      req = Net::HTTP::Get.new(uri.request_uri)
      req['x-c6o-userid'] = user_id if user_id
      res = http.request(req)

      if res.code.to_i != 200
        raise "HTTP request failed with status #{res.code}"
      end

      body = res.body[0..19]
    rescue => e
      response.status = 500
      response.write(e.message)
      return response.finish
    end

    logger.info("Sent response to #{request.ip}, userID=#{user_id}: #{body}")
    response.status = 200
    response.write(body)
    response.finish
  end
end