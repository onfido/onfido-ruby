module Onfido
  class Check < Resource
    def create(applicant_id, payload)
      payload[:applicant_id] = applicant_id
      post(
        url: 'checks',
        payload: payload
      )
    end

    def find(check_id)
      get(url: "checks/#{check_id}")
    end

    def all(applicant_id)
      get(url: "checks?applicant_id=#{applicant_id}")
    end

    def resume(check_id)
      post(url: "checks/#{check_id}/resume")
    end
  end
end
