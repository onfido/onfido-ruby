# frozen_string_literal: true

describe Onfido::WorkflowRun do
  include_context 'fake onfido api'

  subject(:workflow_run) { onfido.workflow_run }

  let(:workflow_run_id) { 'fcb73186-0733-4f6f-9c57-d9d5ef979443' }
  let(:params) do
    {
      'a' => 'b'
    }
  end

  describe '#create' do
    it 'serializes the payload correctly' do
      WebMock.after_request do |request_signature, _response|
        if request_signature.uri.path == 'v3.6/workflow_run'
          expect(Rack::Utils.parse_nested_query(request_signature.body))
            .to eq(params)
        end
      end
    end

    it 'creates a workflow run' do
      response = workflow_run.create(params)
      expect(response['id']).not_to be_nil
    end
  end

  describe '#find' do
    it 'returns the workflow run' do
      response = workflow_run.find(workflow_run_id)

      expect(response['id']).to eq(workflow_run_id)
    end
  end

  describe '#all' do
    it 'returns the workflow runs' do
      response = workflow_run.all({ page: 1, sort: "asc" })

      expect(response.count).to eq(2)
    end
  end
end
