# frozen_string_literal: true

require_relative '../shared_contexts/with_live_photo'

describe Onfido::LivePhoto do
  describe 'Live Photo' do
    include_context 'with live photo'

    it 'uploads a live photo' do
      expect(live_photo).not_to be_nil
      expect(live_photo_id).not_to be_empty
      expect(live_photo.file_name).to eq('sample_photo.png')
      expect(live_photo).to be_an_instance_of Onfido::LivePhoto
    end

    it 'lists live photos' do
      live_photos = onfido_api.list_live_photos(applicant_id)

      expect(live_photos.live_photos.length).to be > 0
      expect(live_photos).to be_an_instance_of Onfido::LivePhotosList
    end

    it 'retrieves live photo' do
      live_photo = onfido_api.find_live_photo(live_photo_id)

      expect(live_photo_id).to eq(live_photo_id)
      expect(live_photo).to be_an_instance_of Onfido::LivePhoto
    end

    it 'downloads live photo' do
      file = onfido_api.download_live_photo(live_photo_id)

      expect(file.length).to be > 0
    end

    it 'raises an error with the correct status code when trying to download an inexistent live photo' do
      inexistent_live_photo_id = '00000000-0000-0000-0000-000000000000'

      expect {
        onfido_api.download_live_photo(inexistent_live_photo_id)
      }.to raise_error(Onfido::ApiError) { |e|
        expect(e.message).to match(/the server returns an error/)
        expect(e.code).to eq(404)
      }
    end
  end
end
