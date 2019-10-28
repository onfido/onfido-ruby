module Onfido
  class Check < Resource
    def create(applicant_id, payload)
      payload[:applicant_id] = applicant_id
      post(
        url: url_for("checks"),
        payload: payload
      )
    end

    def find(check_id)
      get(url: url_for("checks/#{check_id}"))
    end

    def all(applicant_id)
      get(url: url_for("checks?applicant_id=#{applicant_id}"))
    end

    def resume(check_id)
      post(url: url_for("checks/#{check_id}/resume"))
    end
  end
end
