require "faraday"

module Faraday
  class RaiseErrors < ::Faraday::Response::Middleware
    VERSION = "0.3.0"
  end
end
