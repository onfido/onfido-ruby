# frozen_string_literal: true

require 'securerandom'
require_relative '../shared_contexts/with_onfido'

describe Onfido::Passkey do
  describe 'Passkeys' do
    include_context 'with onfido'

    let(:username) { ENV.fetch('ONFIDO_SAMPLE_PASSKEY_USERNAME', 'sample-username') }
    let(:sample_passkey_id) { ENV.fetch('ONFIDO_SAMPLE_PASSKEY_ID', '00000000-0000-0000-0000-000000000000') }

    it 'lists passkeys' do
      passkeys = onfido_api.list_passkeys(username)

      expect(passkeys).to be_an_instance_of(Onfido::PasskeysList)
      expect(passkeys.passkeys.size).to be > 0

      sample_passkey = passkeys.passkeys.find { |passkey| passkey.id == sample_passkey_id } || passkeys.passkeys.first

      expect(sample_passkey).to be_an_instance_of(Onfido::Passkey)
      expect(sample_passkey.application_domain).not_to be_nil
      expect(sample_passkey.state).not_to be_nil
      expect(sample_passkey.created_at).not_to be_nil
      expect(sample_passkey.to_hash).not_to be_nil
    end

    it 'finds a passkey' do
      passkey = onfido_api.find_passkey(username, sample_passkey_id)

      expect(passkey).to be_an_instance_of(Onfido::Passkey)
      expect(passkey.id).to eq(sample_passkey_id)
      expect(passkey.application_domain).not_to be_nil
      expect(passkey.state).not_to be_nil
      expect(passkey.created_at).not_to be_nil
      expect(passkey.to_hash).not_to be_nil
    end

    it 'updates a passkey state' do
      updated_passkey = onfido_api.update_passkey(
        username,
        sample_passkey_id,
        Onfido::PasskeyUpdater.new(state: 'INACTIVE'),
      )

      expect(updated_passkey).to be_an_instance_of(Onfido::Passkey)
      expect(updated_passkey.id).to eq(sample_passkey_id)
      expect(updated_passkey.state).to eq('INACTIVE')
    end

    it 'deletes a passkey successfully' do
      _, status_code, = onfido_api.delete_passkey_with_http_info(username, sample_passkey_id)

      expect(status_code).to eq(204)
    end

    it 'deletes passkeys successfully' do
      _, status_code, = onfido_api.delete_passkeys_with_http_info(username)

      expect(status_code).to eq(204)
    end
  end
end
