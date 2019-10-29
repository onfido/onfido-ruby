module Onfido
  class SdkToken < Resource
    def create(payload)
      post(
        url: 'sdk_token',
        payload: payload
      )
    end
  end
end
