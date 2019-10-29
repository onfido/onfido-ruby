require 'tempfile'

describe Onfido::LiveVideo do
  subject(:live_video) { described_class.new }
  let(:live_video_id) { 'c9701e9b-83aa-442f-995b-20320ee8fb01' }

  describe '#find' do
    it 'returns the expected live photo' do
      response = live_video.find(live_video_id)

      expect(response['id']).to eq(live_video_id)
    end
  end

  describe '#all' do
    it 'returns list of documents' do
      applicant_id = '1030303-123123-123123'
      response = live_video.all(applicant_id)

      expect(response['live_videos']).not_to be_empty
    end
  end

  describe '#download' do
    it 'returns the file data' do
      response = live_video.download(live_video_id)

      expect(response).not_to be_nil
    end
  end
end
