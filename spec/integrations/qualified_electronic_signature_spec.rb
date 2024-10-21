# frozen_string_literal: true

require_relative '../shared_contexts/with_workflow_run'

describe Onfido::WorkflowRun do
  include_context 'with applicant'

  let(:workflow_id) { '8b74614f-9e7f-42fd-852a-5f2bcc852587' }

  let(:workflow_run_builder) do
    Onfido::WorkflowRunBuilder.new({
      applicant_id: applicant_id,
      workflow_id: workflow_id,
      custom_data: {
        country_of_operation: "GBR",
        document_date_of_expiry: "2022-01-01",
        document_issuing_country: "FRA",
        document_issuing_date: "2022-01-01",
        document_number: "Example string",
        document_to_sign_url: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
        document_type: "driving_licence",
      }
    })
  end

  let(:workflow_run) { onfido_api.create_workflow_run(workflow_run_builder) }
  let!(:workflow_run_id) { workflow_run.id }

  let(:file_id) do
    task = onfido_api.list_tasks(workflow_run_id)[1]

    output = repeat_request_until_task_output_changes(
      max_retries = 10,
      interval = 3
    ) { onfido_api.find_task(workflow_run_id, task.id) }.output

    output[:properties][:signed_documents][0][:id]
  end

  describe 'Workflow run' do
    it 'downloads qes document' do
      file = onfido_api.download_qes_document(workflow_run_id, file_id)

      expect(file.size).to be > 0
    end
  end
end
