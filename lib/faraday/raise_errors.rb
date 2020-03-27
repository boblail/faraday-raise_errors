require "faraday"
require "faraday/http_errors"
require "faraday/raise_errors/version"

module Faraday

  class RaiseErrors < ::Faraday::Response::Middleware
    def on_complete(env)
      case env[:status]
      when 404
        raise Faraday::ResourceNotFound, response_values(env)
      when 407
        # mimic the behavior that we get with proxy requests with HTTPS
        raise Faraday::ConnectionFailed, %{407 "Proxy Authentication Required "}
      when 400..599
        error = Faraday::HTTP::ERRORS.fetch(env[:status], :UnrecognizedResponse)
        exception = Faraday::HTTP.const_get error
        raise exception.new(env)
      end
    end

    def response_values(env)
      { status: env[:status], headers: env[:response_headers], body: env[:body] }
    end
  end

end
