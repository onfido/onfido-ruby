module Onfido
  class Check < Resource
    def create(applicant_id:, report_names:, **payload)
      payload[:applicant_id] = applicant_id
      payload[:report_names] = report_names

      post(path: 'checks', payload: payload)
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

    def download(check_id)
      get(path: "checks/#{check_id}/download")
    end
  end
end
