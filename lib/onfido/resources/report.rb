module Onfido
  class Report < Resource
    def find(report_id)
      get(url: "reports/#{report_id}")
    end

    def all(check_id)
      get(url: "reports?check_id=#{check_id}")
    end

    def resume(report_id)
      post(url: "reports/#{report_id}/resume")
    end

    def cancel(report_id)
      post(url: "reports/#{report_id}/cancel")
    end
  end
end
