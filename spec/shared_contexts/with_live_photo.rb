# frozen_string_literal: true

require_relative '../shared_contexts/with_applicant'

RSpec.shared_context 'with live photo', shared_context: :metadata do
  include_context 'with applicant'

  let(:live_photo_file_name) { 'sample_photo.png' }
  let(:live_photo_file) { File.open("spec/integrations/media/#{live_photo_file_name}") }

  let(:live_photo) do
    onfido_api.upload_live_photo(
      applicant_id: applicant_id,
      file: live_photo_file,
    )
  end
  let!(:live_photo_id) { live_photo.id }
end
