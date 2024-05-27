# frozen_string_literal: true

require_relative '../shared_contexts/with_workflow_run'

describe Onfido::Task do
  describe 'Tasks' do
    include_context 'with workflow run'

    it 'lists tasks' do
      list_of_tasks = onfido_api.list_tasks(workflow_run_id)

      expect(list_of_tasks).to_not be_nil
      expect(list_of_tasks[0]).to be_an_instance_of Onfido::TaskItem
      expect(list_of_tasks.size).to eq 2
    end

    it 'finds a task' do
      task = onfido_api.list_tasks(workflow_run_id)[0]
      get_task = onfido_api.find_task(workflow_run_id, task.id)

      expect(get_task).to_not be_nil
      expect(get_task).to be_an_instance_of Onfido::Task
      expect(get_task.id).to eq task.id
      expect(get_task.task_def_id).to eq task.task_def_id
    end

    it 'completes a task' do
      tasks = onfido_api.list_tasks(workflow_run_id)
      profile_data_task_id = (tasks.select { |task| task.id.include? 'profile' })[0].id

      complete_task_builder = Onfido::CompleteTaskBuilder.new({
        data: Onfido::CompleteTaskDataBuilder.build({
          first_name: 'Jane',
          last_name: 'Doe',
        })
      })

      onfido_api.complete_task(workflow_run_id, profile_data_task_id, complete_task_builder)
      task_outputs = onfido_api.find_task(workflow_run_id, profile_data_task_id).output

      expect(task_outputs[:first_name]).to eq 'Jane'
      expect(task_outputs[:last_name]).to eq 'Doe'
    end
  end
end
