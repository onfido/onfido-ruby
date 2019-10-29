module Onfido
  class Check < Resource
    def create(applicant_id, payload)
      payload[:applicant_id] = applicant_id
      post(
        path: 'checks',
        payload: payload
      )
    end

    def find(check_id)
      get(path: "checks/#{check_id}")
    end

    def all(applicant_id)
      get(path: "checks?applicant_id=#{applicant_id}")
    end

    def resume(check_id)
      post(path: "checks/#{check_id}/resume")
    end
  end
end
