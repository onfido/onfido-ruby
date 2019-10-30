module Onfido
  class Document < Resource
    # with open-uri the file can be a link or an actual file

    def create(applicant_id:, file:, type:, **payload)
      validate_file!(file)
      payload[:applicant_id] = applicant_id
      payload[:file] = file
      payload[:type] = type

      post(path: 'documents', payload: payload)
    end

    def find(document_id)
      get(path: "documents/#{document_id}")
    end

    def download(document_id)
      get(path: "documents/#{document_id}/download")
    end

    def all(applicant_id)
      get(path: "documents?applicant_id=#{applicant_id}")
    end
  end
end
