# frozen_string_literal: true

require 'securerandom'

require_relative '../shared_contexts/with_onfido'

describe Onfido::BiometricToken do
  describe 'Biometric tokens' do
    include_context 'with onfido'

    let(:biometric_workflow_id) { 'b79dcf69-41a0-412d-b803-d1a618730f72' }
    let(:customer_user_id) { "test-user-id-#{SecureRandom.uuid}" }
    let(:unique_suffix) { SecureRandom.hex(4) }
    let(:applicant_builder) do
      Onfido::ApplicantBuilder.new(
        first_name: "First#{unique_suffix}",
        last_name: "Last#{unique_suffix}",
        email: "first.last.#{unique_suffix}@example.com",
        consents: [
          Onfido::ApplicantConsentBuilder.new(
            name: Onfido::ApplicantConsentName::PRIVACY_NOTICES_READ,
            granted: true,
          ),
        ],
      )
    end
    let(:applicant_id) { onfido_api.create_applicant(applicant_builder).id }
    let(:live_photo_file) { File.open('spec/integrations/media/sample_photo.png') }
    let(:live_photo) do
      onfido_api.upload_live_photo(
        applicant_id: applicant_id,
        file: live_photo_file,
      )
    end
    let(:workflow_run_builder) do
      Onfido::WorkflowRunBuilder.new(
        applicant_id: applicant_id,
        workflow_id: biometric_workflow_id,
        customer_user_id: customer_user_id,
        custom_data: {
          media_ids: [
            {
              id: live_photo.id,
            },
          ],
        },
      )
    end
    let(:workflow_run) { onfido_api.create_workflow_run(workflow_run_builder) }
    let(:biometric_tokens) do
      created_workflow_run = workflow_run

      expect(created_workflow_run.customer_user_id).to eq(customer_user_id)

      repeat_request_until_biometric_tokens_created(customer_user_id)
    end
    let(:biometric_token) { biometric_tokens.biometric_tokens.first }
    let(:biometric_token_id) { biometric_token.uuid }

    def repeat_request_until_biometric_tokens_created(user_id, max_retries = 10, interval = 3)
      attempts = 0

      loop do
        response = onfido_api.list_biometric_tokens(user_id)
        return response if response.biometric_tokens.any?

        raise 'Biometric tokens were not created in time' if attempts >= max_retries

        attempts += 1
        sleep(interval)
      end
    end

    it 'lists biometric tokens' do
      expect(biometric_tokens).to be_an_instance_of(Onfido::BiometricTokensResponse)
      expect(biometric_tokens.biometric_tokens.length).to be > 0
      expect(biometric_token.uuid).not_to be_nil
      expect(biometric_token.data.status).not_to be_nil
    end

    it 'finds a biometric token' do
      biometric_token_response = onfido_api.find_biometric_token(customer_user_id, biometric_token_id)

      expect(biometric_token_response).to be_an_instance_of(Onfido::BiometricTokenResponse)
      expect(biometric_token_response.biometric_token.uuid).to eq(biometric_token_id)
      expect(biometric_token_response.biometric_token.data.status).not_to be_nil
    end

    it 'updates a biometric token status' do
      approved_status = 'approved'

      updated_biometric_token = onfido_api.update_biometric_token(
        customer_user_id,
        biometric_token_id,
        Onfido::BiometricTokenUpdater.new(status: approved_status),
      )

      expect(updated_biometric_token).to be_an_instance_of(Onfido::UpdatedBiometricTokenResponse)
      expect(updated_biometric_token.biometric_token.uuid).to eq(biometric_token_id)
      expect(updated_biometric_token.biometric_token.data.status).to eq(approved_status)
    end

    it 'invalidates a biometric token successfully' do
      invalidated_biometric_token, status_code, = onfido_api.invalidate_biometric_token_with_http_info(
        customer_user_id,
        biometric_token_id,
        debug_return_type: 'Object',
      )

      expect(invalidated_biometric_token).to be_a(Hash)
      expect(status_code).to eq(200)
    end

    it 'invalidates biometric tokens successfully' do
      invalidated_biometric_tokens, status_code, = onfido_api.invalidate_biometric_tokens_with_http_info(customer_user_id)

      expect(invalidated_biometric_tokens).to be_an_instance_of(Onfido::InvalidatedBiometricTokensResponse)
      expect(invalidated_biometric_tokens.biometric_tokens.deleted_items.count).to eq(0)
      expect(status_code).to eq(200)
    end
  end
end