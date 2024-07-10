# frozen_string_literal: true

require_relative '../shared_contexts/with_workflow_run'

describe Onfido::WorkflowRun do
  describe 'Workflow run' do
    include_context 'with workflow run'

    let(:file_id) { '58813a17-904c-408f-8105-127dc8144b3e' }

    it 'downloads evidence file' do
      file = onfido_api.download_qes_document(workflow_run_id, file_id)

      expect(file.size).to be > 0
    end
  end
end
