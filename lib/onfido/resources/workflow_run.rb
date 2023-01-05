# frozen_string_literal: true

module Onfido
  class WorkflowRun < Resource
    def create(payload)
      post(path: 'workflow_runs', payload: payload)
    end

    def find(workflow_run_id)
      get(path: "workflow_runs/#{workflow_run_id}")
    end

    def all(query_params = {})
      get(path: "workflow_runs?#{stringify_query_params(query_params)}")
    end
  end
end
