require 'onfido/webhook_event_verifier'
require 'spec_helper'

describe Onfido::WebhookEventVerifier do
  subject { described_class.new('wU99mE6jJ7nXOLFwZ0tJymM1lpI15pZh') }
  describe "#read_payload" do
    let(:event_body) { '{"payload":{"resource_type":"check","action":"check.completed","object":{"id":"f2302f45-227d-413d-ad61-09ec077a086a","status":"complete","completed_at_iso8601":"2024-04-04T09:21:21Z","href":"https://api.onfido.com/v3.6/checks/f2302f45-227d-413d-ad61-09ec077a086a"}}}' }
    let(:sig) { "77ebc3e418f26be6eebb47f7ebe551321de26734fc273961e075fc9ab163d9c7" }
    it "raises an exception when the signature is invalid" do
      expect do
        subject.read_payload(event_body, "77ebc3e418f26be6eebb47f7ebe551321de26734fc273961e075fc9ab163d9c8")
      end.to raise_error(Onfido::OnfidoInvalidSignatureError, "Invalid signature for webhook event")
    end

    it "returns the decoded event payload" do
      expected_payload = JSON.parse(event_body)["payload"]
      expected_webhook_event = Onfido::WebhookEvent.new({payload: Onfido::WebhookEventPayload.build_from_hash(expected_payload)})
      
      webhook_event = subject.read_payload(event_body, sig)
      expect(webhook_event.payload).to eq(expected_webhook_event.payload)
      expect(webhook_event.payload.resource_type).to eq('check')
      expect(webhook_event.payload.action).to eq('check.completed')
      expect(webhook_event.payload.object.id).to eq('f2302f45-227d-413d-ad61-09ec077a086a')
      expect(webhook_event.payload.object.status).to eq('complete')
      expect(webhook_event.payload.object.completed_at_iso8601).to eq(Time.parse('2024-04-04T09:21:21Z'))
      expect(webhook_event.payload.object.href).to eq('https://api.onfido.com/v3.6/checks/f2302f45-227d-413d-ad61-09ec077a086a')
    end
  end
end