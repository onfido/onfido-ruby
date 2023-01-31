# frozen_string_literal: true

module Onfido
  class Resource # rubocop:todo Metrics/ClassLength
    VALID_HTTP_METHODS = %i[get post put delete].freeze
    REQUEST_TIMEOUT_HTTP_CODE = 408
    ADDITIONAL_HEADERS = { 'Content-Type' => 'application/json; charset=utf-8' }.freeze

    def initialize(options)
      @rest_client = options.rest_client
    end

    private

    attr_reader :rest_client

    def get(path:)
      handle_request { rest_client[path].get(ADDITIONAL_HEADERS) }
    end

    def post(path:, payload: nil, send_json: true)
      parsed_payload = send_json ? payload.to_json : payload
      additional_headers = send_json ? ADDITIONAL_HEADERS : {}

      handle_request { rest_client[path].post(parsed_payload, additional_headers) }
    end

    def put(path:, payload: nil)
      handle_request { rest_client[path].put(payload.to_json, ADDITIONAL_HEADERS) }
    end

    def patch(path:, payload: nil)
      handle_request { rest_client[path].patch(payload.to_json, ADDITIONAL_HEADERS) }
    end

    def delete(path:)
      handle_request { rest_client[path].delete(ADDITIONAL_HEADERS) }
    end

    def handle_request
      response = yield

      # response should be parsed only when there is a response expected
      parse(response) unless response.code == 204 # no_content
    rescue RestClient::ExceptionWithResponse => e
      if e.response && !timeout_response?(e.response)
        handle_api_error(e.response)
      else
        handle_restclient_error(e)
      end
    rescue RestClient::Exception, Errno::ECONNREFUSED => e
      handle_restclient_error(e)
    end

    def parse(response)
      content_type = response.headers[:content_type]
      if content_type&.include?('application/json')
        JSON.parse(response.body.to_s)
      else
        response.body
      end
    rescue JSON::ParserError
      general_api_error(response.code, response.body)
    end

    def timeout_response?(response)
      response.code.to_i == REQUEST_TIMEOUT_HTTP_CODE
    end

    # There seems to be a serialization issue with the HTTP client
    # which does not serialize the payload properly.
    # Have a look here https://gist.github.com/PericlesTheo/cb35139c57107ab3c84a

    def build_query(payload)
      if payload[:file]
        payload
      else
        Rack::Utils.build_nested_query(payload)
      end
    end

    def handle_api_error(response)
      parsed_response = parse(response)

      general_api_error(response.code, response.body) unless parsed_response['error']

      error_class = response.code.to_i >= 500 ? ServerError : RequestError

      raise error_class.new(
        parsed_response['error']['message'],
        response_code: response.code,
        response_body: response.body
      )
    end

    def general_api_error(response_code, response_body)
      error_class = response_code.to_i >= 500 ? ServerError : RequestError

      raise error_class.new(
        "Invalid response object from API: #{response_body} " \
        "(HTTP response code was #{response_code})",
        response_code: response_code,
        response_body: response_body
      )
    end

    def handle_restclient_error(error) # rubocop:todo Metrics/MethodLength
      connection_message =
        'Please check your internet connection and try again. ' \
        'If this problem persists, you should let us know at info@onfido.com.'

      message =
        case error
        when RestClient::RequestTimeout
          "Could not connect to Onfido . #{connection_message}"

        when RestClient::ServerBrokeConnection
          "The connection to the server broke before the request completed. #{connection_message}"

        when RestClient::SSLCertificateNotVerified
          "Could not verify Onfido's SSL certificate. Please make sure " \
          'that your network is not intercepting certificates. '

        when RestClient::BadGateway
          "Could not connect to Onfido. Server may be overloaded." \

        when SocketError
          'Unexpected error when trying to connect to Onfido. ' \
          'You may be seeing this message because your DNS is not working. ' \
          "To check, try running 'host onfido.com' from the command line."

        else
          'Unexpected error communicating with Onfido. ' \
          'If this problem persists, let us know at info@onfido.com.'
        end

      full_message = message + "\n\n(Network error: #{error.message})"

      raise ConnectionError, full_message
    end

    def validate_file!(file)
      return if file.respond_to?(:read) && file.respond_to?(:path)

      raise ArgumentError, 'File must be a `File`-like object which responds to ' \
                           '`#read` and `#path`'
    end

    def stringify_query_params(hashed_params)
      URI.encode_www_form_component(hashed_params.map{ |k,v| "#{k}=#{v}" }.join("&"))
    end
  end
end
