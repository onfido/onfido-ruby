require 'onfido/webhook_event_verifier'
require 'spec_helper'

describe Onfido::WebhookEventVerifier do
  subject { described_class.new('YKOC6mkBxi6yK2zlUIrLMvsJMFEZObP5') }
  describe "#read_payload" do
    let(:event_body) { '{"payload":{"resource_type":"workflow_task","action":"workflow_task.started","object":{"id":"profile_1eb92","task_spec_id":"profile_1eb92","task_def_id":"profile_data","workflow_run_id":"bc77c6e5-753a-4580-96a6-aaed3e5a8d19","status":"started","started_at_iso8601":"2024-07-10T12:49:09Z","href":"https://api.eu.onfido.com/v3.6/workflow_runs/bc77c6e5-753a-4580-96a6-aaed3e5a8d19/tasks/profile_1eb92"},"resource":{"created_at":"2024-07-10T12:49:09Z","id":"profile_1eb92","workflow_run_id":"bc77c6e5-753a-4580-96a6-aaed3e5a8d19","updated_at":"2024-07-10T12:49:09Z","input":{},"task_def_version":null,"task_def_id":"profile_data","output":null}}}' }
    let(:sig) { "c95a5b785484f6fa1bc25f381b5595d66bf85cb442eefb06aa007802ee6a4dfa" }
    it "raises an exception when the signature is invalid" do
      expect do
        subject.read_payload(event_body, "c95a5b785484f6fa1bc25f381b5595d66bf85cb442eefb06aa007802ee6a4dfb")
      end.to raise_error(Onfido::OnfidoInvalidSignatureError, "Invalid signature for webhook event")
    end

    it "returns the decoded event payload" do
      expected_payload = JSON.parse(event_body)["payload"]
      expected_webhook_event = Onfido::WebhookEvent.new({ payload: Onfido::WebhookEventPayload.build_from_hash(expected_payload) })

      webhook_event = subject.read_payload(event_body, sig)
      expect(webhook_event.payload).to eq(expected_webhook_event.payload)
      expect(webhook_event.payload.resource_type).to eq(Onfido::WebhookEventResourceType::WORKFLOW_TASK)
      expect(webhook_event.payload.action).to eq(Onfido::WebhookEventType::WORKFLOW_TASK_STARTED)

      expect(webhook_event.payload.object.id).to eq('profile_1eb92')
      expect(webhook_event.payload.object.status).to eq(Onfido::WebhookEventObjectStatus::STARTED)
      expect(webhook_event.payload.object.started_at_iso8601).to eq(Time.parse('2024-07-10T12:49:09Z'))
      expect(webhook_event.payload.object.href).to eq('https://api.eu.onfido.com/v3.6/workflow_runs/bc77c6e5-753a-4580-96a6-aaed3e5a8d19/tasks/profile_1eb92')

      expect(webhook_event.payload.resource.created_at).to eq(Time.parse('2024-07-10T12:49:09Z'))
      expect(webhook_event.payload.resource.id).to eq('profile_1eb92')
      expect(webhook_event.payload.resource.workflow_run_id).to eq('bc77c6e5-753a-4580-96a6-aaed3e5a8d19')
      expect(webhook_event.payload.resource.updated_at).to eq(Time.parse('2024-07-10T12:49:09Z'))
      expect(webhook_event.payload.resource.input).to eq({})
      expect(webhook_event.payload.resource.task_def_version).to eq(nil)
      expect(webhook_event.payload.resource.task_def_id).to eq('profile_data')
      expect(webhook_event.payload.resource.output).to eq(nil)
    end

    context "when webhook event output is an object" do
      it "is able to decode and read the output field" do
        signature = "e3e5565647f5ccf07b2fd8ac22eab94a0a0619413d981fb768295c820523f7d7"

        event = subject.read_payload(File.read('spec/media/studio_webhook_event_with_object_in_output.json'), signature)

        expect(event.payload.resource.output['properties']).to eq({
          "date_of_birth" => "1990-01-01",
          "date_of_expiry" => "2031-05-28",
          "document_number" => "999999999",
          "document_numbers" => [
            {
              "type"=>"document_number",
              "value"=>"999999999"
            }
          ],
          "document_type" => "passport",
          "first_name" => "Jane",
          "issuing_country" => "GBR",
          "last_name" => "Doe",
        })
      end
    end

    context "when webhook event output is an array" do
      it "is able to decode and read the output field" do
        signature = "f3a5170acfcecf8c1bf6d9cb9995c0d9dec941af83056a721530f8de7af2c293"
        event = subject.read_payload(File.read('spec/media/studio_webhook_event_with_list_in_output.json'), signature)

        expect(event.payload.resource.output).to eq([
          {
            "checksum_sha256"=>"hiwV2PLmeQZzeySPGGwVL48sxVXcyfpXy9LDl1u3lWU=",
            "id"=>"7af75a3a-ba34-4aa5-9e3e-096c9f56256b",
            "type"=>"document_photo"
          }
        ])
      end
    end
  end
end
