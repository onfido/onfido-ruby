module Onfido
  class Extraction < Resource
    def create(document_id:)
      payload = { document_id: document_id }

      post(path: 'extractions', payload: payload)
    end
  end
end
