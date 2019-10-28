module Onfido
  class LivePhoto < Resource
    # with open-uri the file can be a link or an actual file

    def create(applicant_id, payload)
      validate_file!(payload.fetch(:file))
      payload[:applicant_id] = applicant_id

      post(
        url: url_for("/live_photos"),
        payload: payload
      )
    end

    def find(live_photo_id)
      get(url: url_for("live_photos/#{live_photo_id}"))
    end

    def download(live_photo_id)
      get(url: url_for("live_photos/#{live_photo_id}/download"))
    end

    def all(applicant_id)
      get(url: url_for("live_photos?applicant_id=#{applicant_id}"))
    end
  end
end
