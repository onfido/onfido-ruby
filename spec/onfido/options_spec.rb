# frozen_string_literal: true

describe Onfido::Options do
  subject(:options) do
    described_class.new(
      api_key: 'test',
      region: :us,
      open_timeout: 1,
      read_timeout: 2
    )
  end

  it 'checks region is valid' do
    expect { described_class.new(api_key: 'test', region: :aa) }.to raise_error 'Unknown region aa'
  end

  context 'when creating rest client resource' do
    let(:rest_client) { options.rest_client }

    it 'configures with headers' do
      expect(rest_client.options[:headers]).to eq(
        'Accept' => 'application/json',
        'Authorization' => 'Token token=test',
        'User-Agent' => "onfido-ruby/#{Onfido::VERSION}"
      )
    end

    it 'configures with region' do
      expect(rest_client.url).to eq 'https://api.us.onfido.com/v3.3/'
    end

    it 'configures with timeouts' do
      expect(rest_client.options).to include(
        open_timeout: 1,
        read_timeout: 2
      )
    end
  end
end
