# frozen_string_literal: true

require_relative '../shared_contexts/with_check'
require_relative '../shared_examples/file_examples'

describe Onfido::Check do
  describe 'Checks' do
    include_context 'with check'

    it 'creates a check' do
      expect(check).not_to be_nil
      expect(check).to be_an_instance_of Onfido::Check
      expect(check.applicant_id).to eq applicant_id
      expect(check.report_ids.size).to eq 2
      expect(check.status).to eq Onfido::CheckStatus::IN_PROGRESS
    end

    context 'consider check' do
      let(:check_builder) do
        check_builder = Onfido::CheckBuilder.new({
          applicant_id: applicant_id,
          document_ids: [document_id],
          report_names: [Onfido::ReportName::DOCUMENT],
          consider: [Onfido::ReportName::DOCUMENT],
        })
      end

      it 'creates a consider check' do
        expect(check).not_to be_nil
        expect(check).to be_an_instance_of Onfido::Check
        expect(check.applicant_id).to eq applicant_id
      end
    end

    context 'US driving licence check' do
      let(:us_driving_licence_builder) do
        Onfido::UsDrivingLicenceBuilder.new({
          id_number: '12345',
          issue_state: 'GA',
        })
      end

      let(:check_builder) do
        Onfido::CheckBuilder.new({
          applicant_id: applicant_id,
          document_ids: [document_id],
          report_names: [Onfido::ReportName::DOCUMENT],
          us_driving_licence: us_driving_licence_builder,
        })
      end

      it 'creates a driving licence check' do
        expect(check).not_to be_nil
        expect(check).to be_an_instance_of Onfido::Check
        expect(check.applicant_id).to eq applicant_id
      end
    end

    it 'lists checks' do
      list_of_checks = onfido_api.list_checks(applicant_id)

      expect(list_of_checks).not_to be_nil
      expect(list_of_checks).to be_an_instance_of Onfido::ChecksList
      expect(list_of_checks.checks.size).to be > 0
    end

    it 'finds a check' do
      get_check = onfido_api.find_check(check_id)

      expect(get_check).to be_an_instance_of(Onfido::Check)
      expect(get_check.id).to eq check_id
    end

    it 'restarts a check' do
      onfido_api.resume_check(check_id)
    end

    describe 'downloading a check' do
      let(:file) { onfido_api.download_check(check_id) }

      it_behaves_like "a valid PDF file"
    end
  end
end
