# frozen_string_literal: true
require 'onfido'

Onfido.configure do |config|
  config.api_token = ENV["ONFIDO_API_TOKEN"]
  config.debugging = true
  config.region = config.region[:EU]
end

describe Onfido::IdPhoto do

  before(:context) do
    @applicant_id = ENV["ONFIDO_SAMPLE_APPLICANT_ID"]

    @onfido_api = Onfido::DefaultApi.new

    @id_photo = @onfido_api.upload_id_photo(
      applicant_id: @applicant_id,
      file: File.new('spec/integrations/media/sample_photo.png')
    )
  end

  describe '#Id Photos' do
    it 'uploads a Id photo' do
      expect(@id_photo).not_to be_nil
      expect(@id_photo.id).not_to be_empty
      expect(@id_photo.file_name).to eq(@id_photo.id + ".png")
      expect(@id_photo).to be_an_instance_of(Onfido::IdPhoto)
    end

    it 'lists id photos' do
      id_photos = @onfido_api.list_id_photos(@applicant_id)

      expect(id_photos.id_photos.length).to be > 0
      expect(id_photos).to be_a(Onfido::IDPhotosList)
    end

    it 'retrieves id photo' do
      id_photo = @onfido_api.find_id_photo(@id_photo.id)

      expect(id_photo.id).to eq(@id_photo.id)
      expect(id_photo).to be_a(Onfido::IdPhoto)
    end

    it 'downloads id photo' do
      file = @onfido_api.download_id_photo(@id_photo.id)

      expect(file.length).to be > 0
    end

    it 'raises an error with the correct status code when trying to download an inexistent id photo' do
      inexistent_id_photo_id = '00000000-0000-0000-0000-000000000000'

      expect {
        @onfido_api.download_id_photo(inexistent_id_photo_id)
      }.to raise_error(Onfido::ApiError) { |e|
        expect(e.message).to match(/the server returns an error/)
        expect(e.code).to eq(404)
      }
    end
  end
end
