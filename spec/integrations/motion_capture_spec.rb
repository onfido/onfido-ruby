# frozen_string_literal: true

require 'onfido'

Onfido.configure do |config|
  config.api_token = ENV["ONFIDO_API_TOKEN"]
  config.debugging = true
  config.region = config.region[:EU]
end

describe Onfido::MotionCapture do

  let(:applicant_id) { ENV['ONFIDO_SAMPLE_APPLICANT_ID'] }
  let(:motion_id) { ENV['ONFIDO_SAMPLE_MOTION_ID_1'] }

  let(:onfido_api) do
    Onfido::DefaultApi.new
  end

  describe '#Motion Captures' do
    it 'lists motion captures' do
      motion_captures = onfido_api.list_motion_captures(applicant_id)

      expect(motion_captures.motion_captures.length).to be > 0
      expect(motion_captures).to be_a(Onfido::MotionCapturesList)
      expect(motion_captures.motion_captures.first).to be_a(Onfido::MotionCapture)
    end

    it 'retrieves motion capture' do
      get_motion_capture = onfido_api.find_motion_capture(motion_id)

      expect(get_motion_capture.id).to eq(motion_id)
      expect(get_motion_capture).to be_a(Onfido::MotionCapture)
    end

    it 'downloads motion capture' do
      file = onfido_api.download_motion_capture(motion_id)

      expect(file.length).to be > 0
    end

    it 'downloads motion capture frame' do
      file = onfido_api.download_motion_capture_frame(motion_id)

      expect(file.length).to be > 0
    end

    it 'raises an error with the correct status code when trying to download an inexistent motion capture' do
      inexistent_motion_id = '00000000-0000-0000-0000-000000000000'

      expect {
        onfido_api.download_motion_capture(inexistent_motion_id)
      }.to raise_error(Onfido::ApiError) { |e|
        expect(e.message).to match(/the server returns an error/)
        expect(e.code).to eq(404)
      }
    end
  end
end
