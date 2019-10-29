module Onfido
  class SdkToken < Resource
    def create(payload)
      post(
        path: 'sdk_token',
        payload: payload
      )
    end
  end
end
