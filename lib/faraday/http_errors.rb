module Faraday
  module HTTP
    class Error < RuntimeError
      attr_reader :env

      def initialize(env, message=nil)
        @env = env
        super message || default_message(env)
      end

      def default_message(env)
        "#{status} from #{env[:url].host}#{env[:url].path}"
      end

      def status
        env[:status]
      end
    end

    class ClientError < Error; end
    class ServerError < Error; end
    class UnrecognizedResponse < Error; end

    # See httpstatuses.com
    CLIENT_ERRORS = {
      400 => :BadRequest,
      401 => :Unauthorized,
      402 => :PaymentRequired,
      403 => :Forbidden,
      404 => :NotFound,
      405 => :MethodNotAllowed,
      406 => :NotAcceptable,
      407 => :ProxyAuthenticationRequired,
      408 => :RequestTimeout,
      409 => :Conflict,
      410 => :Gone,
      411 => :LengthRequired,
      412 => :PreconditionFailed,
      413 => :PayloadTooLarge,
      414 => :RequestUriTooLong,
      415 => :UnsupportedMediaType,
      416 => :RequestedRangeNotSatisfiable,
      417 => :ExpectationFailed,
      418 => :ImATeapot,
      421 => :MisdirectedRequest,
      422 => :UnprocessableEntity,
      423 => :Locked,
      424 => :FailedDependency,
      426 => :UpgradeRequired,
      428 => :PreconditionRequired,
      429 => :TooManyRequests,
      431 => :RequestHeaderFieldsTooLarge,
      444 => :ConnectionClosedWithoutResponse,
      451 => :UnavailableForLegalReasons,
      499 => :ClientClosedRequest }.freeze

    # See httpstatuses.com
    SERVER_ERRORS = {
      500 => :InternalError,
      501 => :NotImplemented,
      502 => :BadGateway,
      503 => :ServiceUnavailable,
      504 => :GatewayTimeout,
      505 => :HttpVersionNotSupported,
      506 => :VariantAlsoNegotiates,
      507 => :InsufficientStorage,
      508 => :LoopDetected,
      510 => :NotExtended,
      511 => :NetworkAuthenticationRequired,
      599 => :NetworkConnectTimeoutError }.freeze

    ERRORS = CLIENT_ERRORS.merge(SERVER_ERRORS).freeze

    CLIENT_ERRORS.each do |code, error|
      const_set error, Class.new(Faraday::HTTP::ClientError)
    end

    SERVER_ERRORS.each do |code, error|
      const_set error, Class.new(Faraday::HTTP::ServerError)
    end

  end
end
