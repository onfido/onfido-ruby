# frozen_string_literal: true

require 'tempfile'

describe Onfido::MotionCapture do
  include_context 'fake onfido api'

  subject(:motion_capture) { onfido.motion_capture }

  let(:motion_capture_id) { 'b1ae05b7-fb12-47c3-971c-311b56fc8de6' }

  describe '#find' do
    it 'returns the expected motion capture' do
      response = motion_capture.find(motion_capture_id)

      expect(response['id']).to eq(motion_capture_id)
    end
  end

  describe '#all' do
    it 'returns list of motion captures' do
      applicant_id = '1030303-123123-123123'
      response = motion_capture.all(applicant_id)

      expect(response['motion_captures']).not_to be_empty
    end
  end

  describe '#download' do
    it 'returns the file data' do
      response = motion_capture.download(motion_capture_id)

      expect(response).not_to be_nil
    end
  end

  describe '#frame' do
    it 'returns the frame data' do
      response = motion_capture.frame(motion_capture_id)

      expect(response).not_to be_nil
    end
  end
end
