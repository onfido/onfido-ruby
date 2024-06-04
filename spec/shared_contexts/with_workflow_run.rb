# frozen_string_literal: true

require_relative '../shared_contexts/with_applicant'

RSpec.shared_context 'with workflow run', shared_context: :metadata do
  include_context 'with applicant'

  let(:workflow_id) { 'e8c921eb-0495-44fe-b655-bcdcaffdafe5' }

  let(:workflow_run_builder) do
    Onfido::WorkflowRunBuilder.new({
      applicant_id: applicant_id,
      workflow_id: workflow_id,
    })
  end

  let(:workflow_run) { onfido_api.create_workflow_run(workflow_run_builder) }
  let!(:workflow_run_id) { workflow_run.id }
end
