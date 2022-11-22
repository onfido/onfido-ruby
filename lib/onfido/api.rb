# frozen_string_literal: true

module Onfido
  class API
    def initialize(api_key:, region:, **extra_options)
      @options = Onfido::Options.new(api_key: api_key, region: region, **extra_options)
    end

    def applicant
      @applicant ||= Onfido::Applicant.new(options)
    end

    def check
      @check ||= Onfido::Check.new(options)
    end

    def document
      @document ||= Onfido::Document.new(options)
    end

    def live_photo
      @live_photo ||= Onfido::LivePhoto.new(options)
    end

    def live_video
      @live_video ||= Onfido::LiveVideo.new(options)
    end

    def monitor
      @monitor ||= Onfido::Monitor.new(options)
    end

    def motion_capture
      @motion_capture ||= Onfido::MotionCapture.new(options)
    end

    def report
      @report ||= Onfido::Report.new(options)
    end

    def sdk_token
      @sdk_token ||= Onfido::SdkToken.new(options)
    end

    def webhook
      @webhook ||= Onfido::Webhook.new(options)
    end

    def address
      @address ||= Onfido::Address.new(options)
    end

    def extraction
      @extraction ||= Onfido::Extraction.new(options)
    end

    private

    attr_reader :options
  end
end
