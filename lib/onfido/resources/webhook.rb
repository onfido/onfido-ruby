module Onfido
  class Webhook < Resource
    def create(url:, **payload)
      payload[:url] = url
      post(path: 'webhooks', payload: payload)
    end

    def find(webhooks_id)
      get(path: "webhooks/#{webhooks_id}")
    end

    def all
      get(path: 'webhooks')
    end

    # As well as being a normal resource, Onfido::Webhook also supports
    # verifying the authenticity of a webhook by comparing the signature on the
    # request to one computed from the body
    def self.valid?(request_body, request_signature, token)
      if [request_body, request_signature, token].any?(&:nil?)
        raise ArgumentError, "A request body, request signature and token " \
                             "must be provided"
      end

      computed_signature = generate_signature(request_body, token)
      Rack::Utils.secure_compare(request_signature, computed_signature)
    end

    def self.generate_signature(request_body, token)
      OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), token, request_body)
    end
    private_class_method :generate_signature
  end
end
