# frozen_string_literal: true

require 'onfido'

Onfido.configure do |config|
  config.api_token = ENV["ONFIDO_API_TOKEN"]
  config.debugging = true
  config.region = config.region[:EU]
end

describe Onfido::LiveVideo do

  let(:applicant_id) { ENV['ONFIDO_SAMPLE_APPLICANT_ID'] }
  let(:live_video_id) { ENV['ONFIDO_SAMPLE_VIDEO_ID_1'] }

  let(:onfido_api) do
    Onfido::DefaultApi.new
  end

  describe '#Live Videos' do
    it 'lists live videos' do
      live_videos = onfido_api.list_live_videos(applicant_id)

      expect(live_videos.live_videos.length).to be > 0
      expect(live_videos).to be_a(Onfido::LiveVideosList)
      expect(live_videos.live_videos.first).to be_a(Onfido::LiveVideo)
    end

    it 'retrieves live videos' do
      get_live_video = onfido_api.find_live_video(live_video_id)

      expect(get_live_video.id).to eq(live_video_id)
      expect(get_live_video).to be_a(Onfido::LiveVideo)
    end

    it 'downloads live video' do
      file = onfido_api.download_live_video(live_video_id)

      expect(file.length).to be > 0
    end

    it 'downloads live video frame' do
      file = onfido_api.download_live_video_frame(live_video_id)

      expect(file.length).to be > 0
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
