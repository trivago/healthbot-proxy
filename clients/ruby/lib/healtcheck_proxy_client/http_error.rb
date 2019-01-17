module HealtcheckProxyClient
  class HttpError < StandardError
    def initialize(msg, http_error: nil)
      @http_error = http_error
      super(msg)
    end
    attr_reader :http_error
  end
end
