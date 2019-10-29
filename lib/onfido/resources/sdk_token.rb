module Onfido
  class SdkToken < Resource
    def create(applicant_id:, **payload)
      payload[:applicant_id] = applicant_id
      post(path: 'sdk_token', payload: payload)
    end
  end
end
