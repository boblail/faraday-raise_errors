require "faraday"

module Faraday
  class RaiseErrors < ::Faraday::Response::Middleware
    VERSION = "0.4.0"
  end
end
