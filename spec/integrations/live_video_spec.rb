# frozen_string_literal: true

require_relative '../shared_contexts/with_onfido'
require_relative '../shared_examples/file_examples'

describe Onfido::LiveVideo do
  describe 'Live Video' do
    include_context 'with onfido'

    let(:applicant_id) { ENV['ONFIDO_SAMPLE_APPLICANT_ID'] }
    let(:live_video_id) { ENV['ONFIDO_SAMPLE_VIDEO_ID_1'] }

    it 'lists live videos' do
      live_videos = onfido_api.list_live_videos(applicant_id)

      expect(live_videos.live_videos.length).to be > 0
      expect(live_videos).to be_an_instance_of Onfido::LiveVideosList
      expect(live_videos.live_videos.first).to be_an_instance_of Onfido::LiveVideo
    end

    it 'retrieves live videos' do
      get_live_video = onfido_api.find_live_video(live_video_id)

      expect(get_live_video.id).to eq(live_video_id)
      expect(get_live_video).to be_an_instance_of Onfido::LiveVideo
    end

    describe 'downloading live video' do
      let(:file) { onfido_api.download_live_video(live_video_id) }

      it_behaves_like "a valid MP4 file", 165093
    end

    describe 'downloading live video frame' do
      let(:file) { onfido_api.download_live_video_frame(live_video_id) }

      it_behaves_like "a valid JPEG file", 1692
    end

    it 'raises an error with the correct status code when trying to download an inexistent live video' do
      inexistent_live_video_id = '00000000-0000-0000-0000-000000000000'

      expect {
        onfido_api.download_live_video(inexistent_live_video_id)
      }.to raise_error(Onfido::ApiError) { |e|
        expect(e.message).to match(/the server returns an error/)
        expect(e.code).to eq(404)
      }
    end
  end
end
