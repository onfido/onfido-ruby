module Onfido
  class Applicant < Resource
    def create(payload)
      post(url: 'applicants', payload: payload)
    end

    def update(applicant_id, payload)
      put(url: "applicants/#{applicant_id}", payload: payload)
    end

    def destroy(applicant_id)
      delete(url: "applicants/#{applicant_id}")
    end

    def find(applicant_id)
      get(url: "applicants/#{applicant_id}")
    end

    def all(page: 1, per_page: 20)
      get(url: "applicants?page=#{page}&per_page=#{per_page}")
    end

    def restore(applicant_id)
      post(url: "applicants/#{applicant_id}/restore")
    end
  end
end
