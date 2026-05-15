# frozen_string_literal: true

require 'onfido'

RSpec.shared_context 'with onfido' do
  let(:onfido_api) do
    Onfido::DefaultApi.new
  end

  Onfido.configure do |config|
    if ENV['ONFIDO_OAUTH_CLIENT_ID'] && !ENV['ONFIDO_OAUTH_CLIENT_ID'].empty?
      config.set_oauth_credentials(ENV['ONFIDO_OAUTH_CLIENT_ID'], ENV['ONFIDO_OAUTH_CLIENT_SECRET'])
    else
      config.api_token = ENV['ONFIDO_API_TOKEN']
    end

    if ENV['ONFIDO_BASE_PATH'] && !ENV['ONFIDO_BASE_PATH'].empty?
      uri = URI(ENV['ONFIDO_BASE_PATH'])
      config.scheme = uri.scheme
      config.host = uri.host
      config.base_path = uri.path
    else
      config.region = config.region[:EU]
    end
  end
end
