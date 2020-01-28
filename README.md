# Onfido

A thin wrapper for Onfido's API.

[![Gem Version](https://badge.fury.io/rb/onfido.svg)](http://badge.fury.io/rb/onfido)
[![Build Status](https://travis-ci.org/onfido/onfido-ruby.svg?branch=master)](https://travis-ci.org/onfido/onfido-ruby)

This gem supports only `v3` of Onfido's API from version `1.0.0` onwards. The latest version that supports `v2` of Onfido's API is `0.15.0`. `v1` of Onfido's API is deprecated.

The gem is compatible with Ruby 2.2.0 and onwards. Earlier versions of Ruby have [reached end-of-life](https://www.ruby-lang.org/en/news/2017/04/01/support-of-ruby-2-1-has-ended/), are no longer supported and no longer receive security fixes.

Refer to Onfido's [API documentation](https://documentation.onfido.com) for details of the expected requests and responses.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'onfido', '~> 1.0.0'
```

## Configuration

There are 5 configuration options:

```ruby
Onfido.configure do |config|
  config.api_key = '<YOUR_API_KEY>'
  config.logger = Logger.new(STDOUT)
  config.open_timeout = 30
  config.read_timeout = 80
  config.region = nil
end
```

### Regions

The gem will use the default region if no region is specified.

To specify the US region do:
`config.region = :us`

See https://documentation.onfido.com/#regions for supported regions.

## Usage

You can make API calls by using an instance of the `API` class:

```ruby
onfido = Onfido::API.new
```

You can also set an API key as follows, instead of in the initializer configuration:

```ruby
onfido = Onfido::API.new(api_key: '<YOUR_API_KEY>')
```

### Resources

All resources share the same interface when making API calls. Use `.create` to create a resource, `.find` to find one, and `.all` to fetch all resources.

**Note:** *All param keys should be symbols e.g. `{ report_names: ['document'] }`*

#### Applicants

Applicants are the object upon which Onfido checks are performed.

```ruby
onfido.applicant.create(params)                  # => Creates an applicant
onfido.applicant.update('<APPLICANT_ID>', params)  # => Updates an applicant
onfido.applicant.destroy('<APPLICANT_ID>')         # => Schedule an applicant for deletion
onfido.applicant.restore('<APPLICANT_ID>')         # => Restore an applicant scheduled for deletion
onfido.applicant.find('<APPLICANT_ID>')            # => Finds a single applicant
onfido.applicant.all                             # => Returns all applicants
```

**Note:** Calling `api.applicant.destroy` adds the applicant and all associated documents, photos, videos, checks, and reports to the deletion queue. They will be deleted 20 days after the request is made. An applicant that is scheduled for deletion can be restored but applicants that have been permanently deleted cannot.
See https://documentation.onfido.com/#delete-applicant for more information.

#### Documents

Some report types require identity documents (passport, driving licence etc.) in order to be processed.

```ruby
onfido.document.create(applicant_id: '<APPLICANT_ID>', file: <FILE>, type: 'passport') # => Creates a document
onfido.document.find('<DOCUMENT_ID>')      # => Finds a document
onfido.document.download('<DOCUMENT_ID>')  # => Downloads a document as a binary data
onfido.document.all('<APPLICANT_ID>')      # => Returns all documents belonging to an applicant
```

**Note:** The file parameter must be a `File`-like object which responds to `#read` and `#path`.
Previous versions of this gem supported providing a URL to a file accessible over HTTP or a path
to a file in the local filesystem. You should instead load the file yourself and then pass it in
to `#create`.

See https://documentation.onfido.com/#document-types for example document types.

#### Live Photos

Live photos are images of the applicant’s face, typically taken at the same time as documents are provided. These photos are used to perform Facial Similarity Photo reports on the applicant.

```ruby
onfido.live_photo.create(applicant_id: '<APPLICANT_ID>', file: <FILE>) # => Creates a live photo
onfido.live_photo.find('<LIVE_PHOTO_ID>')      # => Finds a live photo
onfido.live_photo.download('<LIVE_PHOTO_ID>')  # => Downloads a live photo as binary data
onfido.live_photo.all('<APPLICANT_ID>')        # => Returns all live photos belonging to an applicant
```

**Note:** The file parameter must be a `File`-like object which responds to `#read` and `#path`.
Previous versions of this gem supported providing a URL to a file accessible over HTTP or a path
to a file in the local filesystem. You should instead load the file yourself and then pass it in
to `#create`.

#### Checks

Checks are performed on an applicant. Depending on the type of check you wish to perform, different information will be required when you create an applicant. A check consists of one or more reports.

```ruby
onfido.check.create(applicant_id: '<APPLICANT_ID>', report_names: ['document', 'facial_similarity_photo']) # => Creates a check
onfido.check.find('<CHECK_ID>')    # => Finds a check
onfido.check.resume('<CHECK_ID>')  # => Resumes a paused check
onfido.check.all('<APPLICANT_ID>') # => Returns all an applicant's checks
```

#### Reports

Reports provide details of the results of some part of a check. They are
created when a check is created, so the Onfido API only provides support for
finding and listing them. For paused reports specifically, additional support for resuming and
 cancelling reports is also available.

```ruby
onfido.report.find('<REPORT_ID>')    # => Finds a report
onfido.report.all('<CHECK_ID>')      # => Returns all the reports in a check
onfido.report.resume('<REPORT_ID>')  # => Resumes a paused report
onfido.report.cancel('<REPORT_ID>')  # => Cancels a paused report
```

#### Address Lookups

Onfido provides an address lookup service, to help ensure well-formatted
addresses are provided when creating applicants. To search for addresses
by postcode, use:

```ruby
onfido.address.all('SE1 4NG') # => Returns all addresses in a given postcode
```

#### Webhook Endpoints

Onfido allows you to set up and view your webhook endpoints via the API, as well
as through the dashboard.

```ruby
onfido.webhook.create(url: "https://webhook.url", events: ['report.completed, check.completed']) # => Registers a webhook endpoint
onfido.webhook.find('<WEBHOOK_ID>')  # => Finds a single webhook endpoint
onfido.webhook.all                 # => Returns all webhook endpoints
```

#### SDK Tokens

Onfido allows you to generate JSON Web Tokens via the API in order to authenticate
with Onfido's [JavaScript SDK](https://github.com/onfido/onfido-sdk-ui).

```ruby
onfido.sdk_token.create(applicant_id: 'applicant_id', referrer: 'referrer') # => Creates a JWT
```

### Error Handling

There are 3 classes of errors raised by the library, all of which subclass `Onfido::OnfidoError`:
- `Onfido::ServerError` is raised whenever Onfido returns a `5xx` response
- `Onfido::RequestError` is raised whenever Onfido returns any other kind of error
- `Onfido::ConnectionError` is raised whenever a network error occurs (e.g., a timeout)

All 3 error classes provide the `response_code`, `response_body`, `json_body`, `type` and `fields` of the error (although for `Onfido::ServerError` and `Onfido::ConnectionError` the last 3 are likely to be `nil`).

```ruby
def create_applicant
  onfido.applicant.create(params)
rescue Onfido::RequestError => e
  e.type          # => 'validation_error'
  e.fields        # => { "email": { "messages": ["invalid format"] } }
  e.response_code # => '422'
end
```

## Webhooks

Each webhook endpoint has a secret token, generated automatically and [exposed](https://onfido.com/documentation#register-webhook) in the API. When sending a request, Onfido includes a signature computed using the request body and this token in the `X-SHA2-Signature` header.

You should compare this provided signature to one you generate yourself with the token to verify that a webhook is a genuine request from Onfido.

```ruby
if Onfido::Webhook.valid?(request.raw_post,
                          request.headers["X-SHA2-Signature"],
                          ENV['ONFIDO_WEBHOOK_TOKEN'])
  process_webhook
else
  render status: 498, text: "498 Token expired/invalid"
end
```

Read more at https://onfido.com/documentation#webhook-security 

## Contributing

1. Fork it ( https://github.com/onfido/onfido-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
