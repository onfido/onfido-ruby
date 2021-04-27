# frozen_string_literal: true

describe Onfido::Webhook do
  include_context 'fake onfido api'

  subject(:webhook) { onfido.webhook }

  describe '#create' do
    let(:params) do
      {
        url: 'https://webhookendpoint.url',
        enabled: true,
        events: [
          'report.completed',
          'check.completed'
        ]
      }
    end

    it 'creates the webhook' do
      response = webhook.create(**params)

      expect(response['id']).to_not be_nil
    end

    it 'responds with the right url' do
      response = webhook.create(**params)

      expect(response['url']).to eq params[:url]
    end
  end

  describe '#find' do
    it 'returns the webhook' do
      webhook_id = 'fcb73186-0733-4f6f-9c57-d9d5ef979443'

      response = webhook.find(webhook_id)

      expect(response['id']).to eq(webhook_id)
    end
  end

  describe '#destroy' do
    it 'removes the webhook' do
      webhook_id = 'fcb73186-0733-4f6f-9c57-d9d5ef979443'
      expect { webhook.destroy(webhook_id) }.not_to raise_error
    end
  end

  describe '#all' do
    it 'returns all the registered webhooks' do
      response = webhook.all

      expect(response['webhooks'].count).to eq 2
    end

    it 'returns with id' do
      response = webhook.all

      expect(response['webhooks'][0]['id']).to_not be_nil
      expect(response['webhooks'][1]['id']).to_not be_nil
    end
  end

  describe '.valid?' do
    subject(:valid?) do
      described_class.valid?(request_body, request_signature, token)
    end

    let(:request_body) { '{"foo":"bar"}' }
    let(:request_signature) do
      '89e60408fec20bfb26bb0f993d5e88307818982f50f23b361a00d679bae8b1dc'
    end
    let(:token) { 'very_secret_token' }

    it { is_expected.to be(true) }

    context 'with an invalid signature' do
      let(:request_signature) do
        's21fd54ew2w1f5d15642132f3d7727ff9a32a7c87072ce514df1f6d3228bec'
      end
      it { is_expected.to be(false) }
    end

    context 'with a nil request signature' do
      let(:request_signature) { nil }
      specify { expect { valid? }.to raise_error(ArgumentError) }
    end

    context 'with a token other than the one used to sign the request' do
      let(:token) { 'quite_secret_token' }
      it { is_expected.to be(false) }
    end

    context 'with a nil token' do
      let(:token) { nil }
      specify { expect { valid? }.to raise_error(ArgumentError) }
    end

    context 'with a modified request body' do
      let(:request_body) { '{"bar":"baz"}' }
      it { is_expected.to be(false) }
    end

    context 'with a nil request body' do
      let(:request_body) { nil }
      specify { expect { valid? }.to raise_error(ArgumentError) }
    end
  end
end
