# frozen_string_literal: true

require_relative '../shared_contexts/with_workflow_run'

describe Onfido::WorkflowRun do
  describe 'Workflow run' do
    include_context 'with workflow run'

    it 'creates a workflow run' do
      expect(workflow_run).to be_an_instance_of Onfido::WorkflowRun
      expect(workflow_run.applicant_id).to eq applicant_id
      expect(workflow_run.status).to eq 'awaiting_input'
    end

    context 'workflow run with custom inputs' do
      let(:workflow_id) { '45092b29-f220-479e-aa6f-a6f989baac4c' }
      let(:workflow_run_builder) do
        Onfido::WorkflowRunBuilder.new({
          applicant_id: applicant_id,
          workflow_id: workflow_id,
          custom_data: {
            age: 18,
            is_employed: false
          }
        })
      end
      
      it 'creates a workflow run with custom inputs' do
        expect(workflow_run).to be_an_instance_of Onfido::WorkflowRun
        expect(workflow_run.workflow_id).to eq workflow_id
        expect(workflow_run.status).to eq 'approved'
      end
    end

    it 'lists workflow runs' do
      list_of_workflow_runs = onfido_api.list_workflow_runs()

      expect(list_of_workflow_runs[0]).to be_an_instance_of Onfido::WorkflowRun
      expect(list_of_workflow_runs.size).to be > 0
    end

    it 'finds a workflow run' do
      get_workflow_run = onfido_api.find_workflow_run(workflow_run_id)

      expect(get_workflow_run).to be_an_instance_of Onfido::WorkflowRun
      expect(get_workflow_run.id).to eq workflow_run_id
    end

    it 'downloads evidence file' do
      file = onfido_api.download_signed_evidence_file(workflow_run_id)

      expect(file.size).to be > 0
    end
  end
end
