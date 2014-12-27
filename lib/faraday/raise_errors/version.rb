require "faraday"

module Faraday
  class RaiseErrors < ::Faraday::Response::Middleware
    VERSION = "0.2.0"
  end
end
