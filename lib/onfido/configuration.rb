module Onfido
  module Configuration
    REGION_HOSTS = {
      us: "api.us.onfido.com"
    }.freeze

    attr_accessor :api_key, :region, :open_timeout, :read_timeout

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def reset
      self.api_key = nil
      self.region = nil
      self.open_timeout = 30
      self.read_timeout = 80
      RestClient.log = nil
    end

    def logger=(log)
      unless log.respond_to?(:<<)
        raise "#{log.class} doesn't seem to behave like a logger!"
      end

      RestClient.log = log
    end

    def logger
      RestClient.log ||= NullLogger.new
    end

    def endpoint
      region_host = region ? REGION_HOSTS[region.downcase.to_sym] : "api.onfido.com"
      unless region_host
        raise "The region \"#{region.downcase}\" is not currently supported"
      end

      "https://#{region_host}/v3/"
    end
  end
end
