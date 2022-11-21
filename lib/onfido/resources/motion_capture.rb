# frozen_string_literal: true

module Onfido
  class MotionCapture < Resource
    def find(motion_capture_id)
      get(path: "motion_captures/#{motion_capture_id}")
    end

    def download(motion_capture_id)
      get(path: "motion_captures/#{motion_capture_id}/download")
    end

    def frame(motion_capture_id)
      get(path: "motion_captures/#{motion_capture_id}/frame")
    end

    def all(applicant_id)
      get(path: "motion_captures?applicant_id=#{applicant_id}")
    end
  end
end
