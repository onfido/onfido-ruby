# frozen_string_literal: true

require_relative '../shared_contexts/with_workflow_run'

describe Onfido::WorkflowRun do
  include_context 'with applicant'

  let(:workflow_id) { '9554c27e-9886-4052-992d-816467d97d24' }

  let(:workflow_run_builder) do
    Onfido::WorkflowRunBuilder.new({
      applicant_id: applicant_id,
      workflow_id: workflow_id,
      custom_data: {
        face_result: "clear",
        doc_result: "clear",
        transaction_id: "995bf84c-d708-4977-8b88-d4b66bebdaf6",
      }
    })
  end

  let(:workflow_run) { onfido_api.create_workflow_run(workflow_run_builder) }
  let!(:workflow_run_id) { workflow_run.id }

  def get_task_output(workflow_run_id, task_index = 1)
    task = onfido_api.list_tasks(workflow_run_id)[task_index]

    repeat_request_until_task_output_changes(
      max_retries = 10,
      interval = 3
    ) { onfido_api.find_task(workflow_run_id, task.id) }.output
  end

  let(:signed_document_file_id) do
    get_task_output(workflow_run_id)[:properties][:signed_documents][0][:id]
  end

  let(:transaction_receipt_file_id) do
    get_task_output(workflow_run_id)[:properties][:receipt_document][:id]
  end

  describe 'Workflow run' do
    it 'downloads aes documents' do
      signed_document = onfido_api.download_aes_document(workflow_run_id, signed_document_file_id)
      expect(signed_document.size).to be > 0

      transaction_receipt = onfido_api.download_aes_document(workflow_run_id, transaction_receipt_file_id)
      expect(transaction_receipt.size).to be > 0
    end
  end
end
