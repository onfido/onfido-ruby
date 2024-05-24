# frozen_string_literal: true
require 'onfido'

Onfido.configure do |config|
  config.api_token = ENV["ONFIDO_API_TOKEN"]
  config.debugging = true
  config.region = config.region[:EU]
end

describe Onfido::LivePhoto do

  before(:context) do
    @applicant_id = ENV["ONFIDO_SAMPLE_APPLICANT_ID"]

    @onfido_api = Onfido::DefaultApi.new

    @live_photo = @onfido_api.upload_live_photo(
      applicant_id: @applicant_id,
      file: File.new("spec/integrations/media/sample_photo.png")
    )
  end


  describe '#Live Photos' do
    it 'uploads a live photo' do
      expect(@live_photo).not_to be_nil
      expect(@live_photo.id).not_to be_empty
      expect(@live_photo.file_name).to eq('sample_photo.png')
      expect(@live_photo).to be_an_instance_of(Onfido::LivePhoto)
    end

    it 'lists live photos' do
      live_photos = @onfido_api.list_live_photos(@applicant_id)

      expect(live_photos.live_photos.length).to be > 0
      expect(live_photos).to be_a(Onfido::LivePhotosList)
    end

    it 'retrieves live photo' do
      live_photo = @onfido_api.find_live_photo(@live_photo.id)

      expect(live_photo.id).to eq(@live_photo.id)
      expect(live_photo).to be_a(Onfido::LivePhoto)
    end

    it 'downloads live photo' do
      file = @onfido_api.download_live_photo(@live_photo.id)

      expect(file.length).to be > 0
    end

    it 'raises an error with the correct status code when trying to download an inexistent live photo' do
      inexistent_live_photo_id = '00000000-0000-0000-0000-000000000000'

      expect {
        @onfido_api.download_live_photo(inexistent_live_photo_id)
      }.to raise_error(Onfido::ApiError) { |e|
        expect(e.message).to match(/the server returns an error/)
        expect(e.code).to eq(404)
      }
    end
  end
end
