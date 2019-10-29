module Onfido
  class LiveVideo < Resource
    def find(live_video_id)
      get(url: "live_videos/#{live_video_id}")
    end

    def download(live_video_id)
      get(url: "live_videos/#{live_video_id}/download")
    end

    def all(applicant_id)
      get(url: "live_videos?applicant_id=#{applicant_id}")
    end
  end
end
