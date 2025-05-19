# frozen_string_literal: true

require_relative '../shared_contexts/with_applicant'
require_relative '../shared_examples/file_examples'

describe Onfido::IdPhoto do
  describe 'Id Photo' do
    include_context 'with applicant'

    let(:id_photo) do
      onfido_api.upload_id_photo(
        applicant_id: applicant_id,
        file: File.new('spec/integrations/media/sample_photo.png')
      )
    end
    let!(:id_photo_id) { id_photo.id }

    it 'uploads a Id photo' do
      expect(id_photo).not_to be_nil
      expect(id_photo_id).not_to be_empty
      expect(id_photo).to be_an_instance_of Onfido::IdPhoto
      expect(id_photo.file_name).to eq "#{id_photo_id}.png"
    end

    it 'lists id photos' do
      id_photos = onfido_api.list_id_photos(applicant_id)

      expect(id_photos.id_photos.length).to be > 0
      expect(id_photos).to be_an_instance_of Onfido::IdPhotosList
    end

    it 'retrieves id photo' do
      get_id_photo = onfido_api.find_id_photo(id_photo_id)

      expect(get_id_photo).to be_an_instance_of Onfido::IdPhoto
      expect(get_id_photo.id).to eq id_photo_id
    end

    describe 'downloading id photo' do
      let(:file) { onfido_api.download_id_photo(id_photo_id) }

      it_behaves_like "a valid PNG file", 395856
    end

    it 'raises an error with the correct status code when trying to download an inexistent id photo' do
      inexistent_id_photo_id = '00000000-0000-0000-0000-000000000000'

      expect {
        onfido_api.download_id_photo(inexistent_id_photo_id)
      }.to raise_error(Onfido::ApiError) { |e|
        expect(e.message).to match(/the server returns an error/)
        expect(e.code).to eq(404)
      }
    end
  end
end
