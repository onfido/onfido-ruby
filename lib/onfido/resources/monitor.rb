# frozen_string_literal: true

module Onfido
  class Monitor < Resource
    def create(applicant_id:, report_name:, **payload)
      payload[:applicant_id] = applicant_id
      payload[:report_name] = report_name

      post(path: 'watchlist_monitors', payload: payload)
    end

    def find(monitor_id)
      get(path: "watchlist_monitors/#{monitor_id}")
    end

    def all(applicant_id)
      get(path: "watchlist_monitors?applicant_id=#{applicant_id}")
    end

    def destroy(monitor_id)
      delete(path: "watchlist_monitors/#{monitor_id}")
    end

    def list_matches(monitor_id)
      get(path: "watchlist_monitors/#{monitor_id}/matches")
    end

    def set_match_status(monitor_id, **payload)
      patch(path: "watchlist_monitors/#{monitor_id}/matches", payload: payload)
    end
  end
end
