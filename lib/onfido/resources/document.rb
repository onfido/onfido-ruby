module Onfido
  class Document < Resource
    # with open-uri the file can be a link or an actual file

    def create(applicant_id, payload)
      validate_file!(payload.fetch(:file))
      payload[:applicant_id] = applicant_id

      post(
        url: url_for("documents"),
        payload: payload
      )
    end

    def find(document_id)
      get(url: url_for("documents/#{document_id}"))
    end

    def download(document_id)
      get(url: url_for("documents/#{document_id}/download"))
    end

    def all(applicant_id)
      get(url: url_for("documents?applicant_id=#{applicant_id}"))
    end
  end
end
