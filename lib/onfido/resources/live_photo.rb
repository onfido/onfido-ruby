# frozen_string_literal: true

module Onfido
  class LivePhoto < Resource
    # with open-uri the file can be a link or an actual file

    def create(applicant_id:, file:, **payload)
      validate_file!(file)
      payload[:applicant_id] = applicant_id
      payload[:file] = file

      post(path: 'live_photos', payload: payload, send_json: false)
    end

    def find(live_photo_id)
      get(path: "live_photos/#{live_photo_id}")
    end

    def download(live_photo_id)
      get(path: "live_photos/#{live_photo_id}/download")
    end

    def all(applicant_id)
      get(path: "live_photos?applicant_id=#{applicant_id}")
    end
  end
end
