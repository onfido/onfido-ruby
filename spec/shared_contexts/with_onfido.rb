# frozen_string_literal: true

require 'onfido'

RSpec.shared_context 'with onfido' do
  let(:onfido_api) do
    Onfido::DefaultApi.new
  end

  Onfido.configure do |config|
    config.api_token = ENV['ONFIDO_API_TOKEN']
    config.region = config.region[:EU]
  end
end
