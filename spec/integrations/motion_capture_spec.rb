# frozen_string_literal: true

require_relative '../shared_contexts/with_onfido'
require_relative '../shared_examples/file_examples'

describe Onfido::MotionCapture do
  describe 'Motion Capture' do
    include_context 'with onfido'

    let(:applicant_id) { ENV['ONFIDO_SAMPLE_APPLICANT_ID'] }
    let(:motion_id) { ENV['ONFIDO_SAMPLE_MOTION_ID_1'] }

    it 'lists motion captures' do
      motion_captures = onfido_api.list_motion_captures(applicant_id)

      expect(motion_captures.motion_captures.length).to be > 0
      expect(motion_captures).to be_an_instance_of Onfido::MotionCapturesList
      expect(motion_captures.motion_captures.first).to be_an_instance_of Onfido::MotionCapture
    end

    it 'retrieves motion capture' do
      get_motion_capture = onfido_api.find_motion_capture(motion_id)

      expect(get_motion_capture.id).to eq(motion_id)
      expect(get_motion_capture).to be_an_instance_of Onfido::MotionCapture
    end

    describe 'downloading live video' do
      let(:file) { onfido_api.download_motion_capture(motion_id) }

      it_behaves_like "a valid MP4 file", 2720276
    end

    describe 'downloading live video frame' do
      let(:file) { onfido_api.download_motion_capture_frame(motion_id) }

      it_behaves_like "a valid JPEG file", 75627
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
