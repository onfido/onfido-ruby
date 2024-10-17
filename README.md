# Onfido Ruby Library

The official Ruby library for integrating with the Onfido API.

Documentation can be found at <https://documentation.onfido.com>.

This version uses Onfido API v3.6. Refer to our [API versioning guide](https://developers.onfido.com/guide/api-versioning-policy#client-libraries) for details of which client library versions use which versions of the API.

[![Gem Version](https://badge.fury.io/rb/onfido.svg)](https://badge.fury.io/rb/onfido)
![Build Status](https://github.com/onfido/onfido-ruby/actions/workflows/ruby.yml/badge.svg)

## Installation & Usage

### Installation

```ruby
gem onfido, '~> 3.4.0'
```

Configure with your API token, region and optional timeout (default value is 30):

```ruby
require onfido

Onfido.configure do |config|
  config.api_token = ENV["ONFIDO_API_TOKEN"]
  config.region = config.region[:EU]
  config.timeout = 30
end

onfido_api = Onfido::DefaultApi.new
```

All resources share the same interface when making API calls. Use `.create` to create a resource, `.find` to find one, and `.all` to fetch all resources.

### Making a call to the API

```ruby
applicant = onfido_api.create_applicant(
  first_name: 'Test',
  last_name: 'Applicant'
)
```

Documentation and code examples can be found at https://documentation.onfido.com

## Error Handling

All errors are wrapped by `ApiError` coming from [FaradayException](https://www.rubydoc.info/github/lostisland/faraday/Faraday/ClientError):

- `Connection timed out` is raised in case of `Faraday::TimeoutError`
- `Connection failed` is raised in case of `Faraday::ConnectionFailed`

All errors provide the `code`, `response_headers`, and `response_body` of the error.

```ruby
def create_applicant
  onfido_api.create_applicant(params)
rescue Onfido::ApiError => e
  e.message       # => 'Unprocessable entity'
  e.response_body # => { error: { type: "validation_error", message: "", fields: { "email": [ "invalid format" ] } } }
  e.code          # => '422'
end
```

### Webhook event verification

Webhook events payload needs to be verified before it can be accessed. Library allows to easily decode the payload and verify its signature before returning it as an object for user convenience:

```ruby
  require 'onfido/webhook_event_verifier'

  def webhook_verifier()
    verifier = Onfido::WebhookEventVerifier.new(ENV["ONFIDO_WEBHOOK_SECRET_TOKEN"])

    signature = "a0...760e"

    event = verifier.read_payload('{"payload":{"r...3"}}', signature)

  rescue Onfido::OnfidoInvalidSignatureError => e
    e.type
    e.fields
    e.response_code
  end
```

## Contributing

This library is automatically generated using [OpenAPI Generator](https://openapi-generator.tech) (version: 7.9.0); therefore all the contributions, except tests files, should target [Onfido OpenAPI specification repository](https://github.com/onfido/onfido-openapi-spec/tree/master) instead of this repository.

For contributions to the tests instead, please follow the steps below:

1. [Fork](https://github.com/onfido/onfido-ruby/fork) repository
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Make your changes
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

## Versioning policy

[Semantic Versioning](https://semver.org) policy is used for library versioning, following guidelines and limitations below:

- MAJOR versions (x.0.0) might:
  - target a new API version
  - include non-backward compatible change
- MINOR versions (0.x.0) might:
  - add a new functionality, non-mandatory parameter or property
  - deprecate an old functionality
  - include non-backward compatible change to a functionality which is:
    - labelled as alpha or beta
    - completely broken and not usable
- PATCH version (0.0.x) might:
  - fix a bug
  - include backward compatible changes only

## More documentation

More documentation and code examples can be found at <https://documentation.onfido.com>.

## Support

Should you encounter any technical issues during integration, please contact Onfido's Customer Support team via the [Customer Experience Portal](https://public.support.onfido.com/) which also includes support documentation.

