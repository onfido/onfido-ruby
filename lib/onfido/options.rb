# frozen_string_literal: true

module Onfido
  class Options
    REGIONS = %w[eu us ca].freeze

    def initialize(api_key:, region:, open_timeout: 10, read_timeout: 30, unknown_api_url: nil)
      @api_key = api_key
      @region = region.to_s.downcase
      @open_timeout = open_timeout
      @read_timeout = read_timeout
      @unknown_api_url = unknown_api_url

      raise "Unknown region #{@region}" unless REGIONS.include?(@region)
    end

    def rest_client
      @rest_client ||= RestClient::Resource.new(
        base_url,
        read_timeout: read_timeout,
        open_timeout: open_timeout,
        headers: {
          'Authorization' => "Token token=#{api_key}",
          'Accept' => 'application/json',
          'User-Agent' => "onfido-ruby/#{Onfido::VERSION}",
          'Content-Type' => 'application/json; charset=utf-8'
        }
      )
    end

    private

    attr_reader :api_key, :open_timeout, :read_timeout

    def base_url
      @unknown_api_url || "https://api.#{@region}.onfido.com/v3.2/"
    end
  end
end
