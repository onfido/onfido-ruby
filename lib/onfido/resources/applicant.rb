# frozen_string_literal: true

module Onfido
  class Applicant < Resource
    def create(payload)
      post(path: 'applicants', payload: payload)
    end

    def update(applicant_id, payload)
      put(path: "applicants/#{applicant_id}", payload: payload)
    end

    def destroy(applicant_id)
      delete(path: "applicants/#{applicant_id}")
    end

    def find(applicant_id)
      get(path: "applicants/#{applicant_id}")
    end

    def all(page: 1, per_page: 20)
      get(path: "applicants?page=#{page}&per_page=#{per_page}")
    end

    def restore(applicant_id)
      post(path: "applicants/#{applicant_id}/restore")
    end
  end
end
