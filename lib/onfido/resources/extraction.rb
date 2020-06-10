module Onfido
  class Extraction < Resource
    def create(document_id)
      post(path: 'extractions', payload: { document_id: document_id })
    end
  end
end
