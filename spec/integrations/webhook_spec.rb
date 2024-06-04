# frozen_string_literal: true

require_relative '../shared_contexts/with_onfido'

describe Onfido::Webhook do
  describe 'Webhook' do
    include_context 'with onfido'

    let(:webhook_builder) do
      Onfido::WebhookBuilder.new({
        url: 'https://example.com',
        events: ['check.completed', 'report.completed'],
      })
    end

    let(:webhook) { onfido_api.create_webhook(webhook_builder) }
    let(:webhook_id) { webhook.id }

    it 'creates a webhook' do
      expect(webhook).to be_an_instance_of Onfido::Webhook
      expect(webhook_id).to_not be_nil
      expect(webhook.url).to eq 'https://example.com'
      expect(webhook.events).to eq ['check.completed', 'report.completed']
    end

    it 'updates a webhook' do
      webhook_updater = Onfido::WebhookUpdater.new({
        url: 'https://example.co.uk',
        events: ['check.completed'],
      })

      updated_webhook = onfido_api.update_webhook(webhook_id, webhook_updater)
      expect(updated_webhook.id).to eq webhook_id
      expect(updated_webhook.url).to eq 'https://example.co.uk'
      expect(updated_webhook.events).to eq ['check.completed']
    end

    it 'lists webhooks' do
      list_of_webhooks = onfido_api.list_webhooks()

      expect(list_of_webhooks).to be_an_instance_of Onfido::WebhooksList
      expect(list_of_webhooks.webhooks.size).to be > 0
    end

    it 'finds a webhook' do
      get_webhook = onfido_api.find_webhook(webhook_id)

      expect(get_webhook).to be_an_instance_of(Onfido::Webhook)
      expect(get_webhook.id).to eq webhook_id
    end

    it 'deletes a webhook' do
      onfido_api.delete_webhook(webhook_id)

      expect {
        onfido_api.find_webhook(webhook_id)
      }.to raise_error(Onfido::ApiError) { |e|
        expect(e.code).to eq(404)
      }
    end
  end
end
