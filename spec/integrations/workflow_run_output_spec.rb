# frozen_string_literal: true

require_relative '../shared_contexts/with_document'
require_relative '../shared_contexts/with_live_photo'
require_relative '../shared_contexts/with_workflow_run'

describe Onfido::WorkflowRun do
  describe 'Workflow run outputs' do
    include_context 'with workflow run'

    context 'workflow with profile data as output' do
      let(:workflow_id) { 'd27e510b-27a8-44c3-a3cc-bf4c0648a4ba' }

      let(:profile_data) do
        {
          country_residence: 'GBR',
          first_name: 'First',
          last_name: 'Last',
          dob: '2000-01-01',
          email: 'first.last@gmail.com',
          phone_number: '+351911111111',
          nationality: 'GBR',
          phone_number_consent_granted: true,
          address: {
              country: 'GBR',
              line1: '123rd Street',
              line2: '2nd Floor',
              line3: '23',
              town: 'London',
              postcode: 'S2 2DF',
          }
        }
      end  
    
      it 'returns profile data as output' do
        tasks = onfido_api.list_tasks(workflow_run_id)
        profile_data_task_id = (tasks.select { |task| task.id.include? 'profile' })[0].id

        complete_task_builder = Onfido::CompleteTaskBuilder.new({
          data: Onfido::CompleteTaskDataBuilder.build(profile_data)
        })
        onfido_api.complete_task(workflow_run_id, profile_data_task_id, complete_task_builder)

        workflow_run_outputs = onfido_api.find_workflow_run(workflow_run_id).output

        expect(workflow_run_outputs[:profile_capture_data]).to eq profile_data
      end
    end

    context 'workflow run with document and facial similarity reports as output' do
      include_context 'with document'
      include_context 'with live photo'

      let(:workflow_id) { '5025d9fd-7842-4805-bce1-a7bfd7131b4e' }
      let(:profile_data) { { first_name: 'Jane', last_name: 'Doe' } }

      it 'returns document and facial similarity reports' do
        tasks = onfido_api.list_tasks(workflow_run_id)
        profile_data_task_id = (tasks.select { |task| task.id.include? 'profile' })[0].id

        complete_profile_task_builder = Onfido::CompleteTaskBuilder.new({
          data: Onfido::CompleteTaskDataBuilder.build(profile_data)
        })
        onfido_api.complete_task(
          workflow_run_id,
          profile_data_task_id,
          complete_profile_task_builder,
        )

        tasks = onfido_api.list_tasks(workflow_run_id)
        document_capture_task_id = (tasks.select { |task| task.id.include? 'document_photo' })[0].id

        complete_document_capture_task_builder = Onfido::CompleteTaskBuilder.new(
          data: Onfido::CompleteTaskDataBuilder.build([{ id: document_id }])
        )
        onfido_api.complete_task(
          workflow_run_id,
          document_capture_task_id,
          complete_document_capture_task_builder,
        )

        tasks = onfido_api.list_tasks(workflow_run_id)
        live_photo_capture_task_id = (tasks.select { |task| task.id.include? 'face_photo' })[0].id

        complete_live_photo_capture_task_request = Onfido::CompleteTaskBuilder.new(
          data: Onfido::CompleteTaskDataBuilder.build([{ id: live_photo_id }])
        )
        onfido_api.complete_task(
          workflow_run_id,
          live_photo_capture_task_id,
          complete_live_photo_capture_task_request,
        )

        workflow_run = repeat_request_until_status_changes('approved') do
          onfido_api.find_workflow_run(workflow_run_id)
        end

        document_report_output = workflow_run.output[:doc]
        facial_similarity_report_output = workflow_run.output[:selfie]

        expect(document_report_output[:breakdown]).to_not be_nil
        expect(document_report_output[:properties]).to_not be_nil
        expect(document_report_output[:repeat_attempts]).to_not be_nil
        expect(document_report_output[:result]).to_not be_nil
        expect(document_report_output[:status]).to_not be_nil
        expect(document_report_output[:sub_result]).to_not be_nil
        expect(document_report_output[:uuid]).to_not be_nil

        expect(facial_similarity_report_output[:breakdown]).to_not be_nil
        expect(facial_similarity_report_output[:properties]).to_not be_nil
        expect(facial_similarity_report_output[:result]).to_not be_nil
        expect(facial_similarity_report_output[:status]).to_not be_nil
        expect(facial_similarity_report_output[:uuid]).to_not be_nil
      end
    end
  end
end
