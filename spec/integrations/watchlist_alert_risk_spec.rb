# frozen_string_literal: true

require_relative '../shared_contexts/with_onfido'

describe Onfido::WatchlistAlertRisk do
  describe 'Watchlist alert risks' do
    include_context 'with onfido'

    let(:workflow_id) { '18effbfe-73c3-4680-ae43-e1c474767ff4' }
    let(:onfido_api) do
      configuration = Onfido::Configuration.new
      configuration.api_token = 'api_tests_client_sandbox_token'

      Onfido::DefaultApi.new(Onfido::ApiClient.new(configuration))
    end
    let(:applicant_id) do
      @applicant_id = onfido_api.create_applicant(
        first_name: 'Donald',
        last_name: 'Consider',
        dob: '1990-01-01',
        address: {
          country: 'PRT',
          town: 'Town',
          street: 'Street',
          building_number: '12',
          postcode: '12345',
        },
      ).id
    end
    let(:workflow_run) do
      onfido_api.create_workflow_run(
        Onfido::WorkflowRunBuilder.new(
          applicant_id: applicant_id,
          workflow_id: workflow_id,
          custom_data: {
            national_id: {
              type: 'passport',
              value: 'P1234567',
            },
            nationality: 'PRT',
          },
        ),
      )
    end
    let(:workflow_run_id) { workflow_run.id }
    let(:watchlist_task) do
      task = onfido_api.list_tasks(workflow_run_id).find do |workflow_task|
        workflow_task.task_def_id == 'query_watchlists_complyadvantage_mesh'
      end

      expect(task).not_to be_nil

      repeat_request_until_task_output_changes(30, 2) do
        onfido_api.find_task(workflow_run_id, task.id)
      end
    end
    let(:alert_id) do
      properties = watchlist_task.output[:properties]

      expect(properties[:alert_identifier]).not_to be_nil
      properties[:alert_identifier]
    end

    after do
      onfido_api.delete_applicant(@applicant_id) if @applicant_id
    rescue Onfido::ApiError
      # Ignore cleanup failures.
    end

    it 'retrieves paginated risks for a sandbox alert' do
      risks = onfido_api.list_watchlist_alert_risks(alert_id, page: 1, per_page: 1)

      expect(risks).not_to be_empty
      expect(risks.size).to be <= 1
      expect(risks.first).to be_an_instance_of(Onfido::WatchlistAlertRisk)
      expect(risks.first.identifier).not_to be_nil
      expect(risks.first.decision).not_to be_nil
      expect(risks.first.detail).not_to be_nil
    end
  end
end
