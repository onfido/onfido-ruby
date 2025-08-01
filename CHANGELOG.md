# Changelog

## v5.4.0 28th July 2025

- Release based on Onfido OpenAPI spec version [v5.4.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v5.4.0):
  - [ENT-26] Add AES document download endpoint
- [ENT-26] Add AES documents test

## v5.3.0 11th July 2025

- Release based on Onfido OpenAPI spec version [v5.3.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v5.3.0):
- Release based on Onfido OpenAPI spec version [v5.3.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v5.3.0):
  - [DEXTV2-9494] Add manual_transmission_restriction to document with driver verification report

## v5.2.0 5th June 2025

- Release based on Onfido OpenAPI spec version [v5.2.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v5.2.0):
  - [BIO-7260] Add report configuration (including use_case) to checks

## v5.1.1 19th May 2025

- Release based on Onfido OpenAPI spec version [v5.1.1](https://github.com/onfido/onfido-openapi-spec/releases/tag/v5.1.1):
  - [CAT-1952] Fix corruption in file download

## v5.1.0 14th May 2025

- Release based on Onfido OpenAPI spec version [v5.1.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v5.1.0):
  - CAT-1760: create get applicant consents endpoint
  - Update Ruby library README template
  - [CAT-1911] Fix document_with_driving_licence_information to be a list of objects
  - [AF-1390] Fix: Device Intelligence Report Schema
  - [CAT-1944] Add OAuth fields for Webhook authentication
  - Fix storage of device_fingerprint_reuse breakdown and properties as float
  - Add .markdownlint.json to templates

**DEPRECATION NOTICE**: This release has been **deprecated** in favour of [v5.1.1](#v511-19th-may-2025).

## v5.0.0 21st February 2025

- Release based on Onfido OpenAPI spec version [v5.0.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v5.0.0):
  - Denote webhook event payload.object.href as a not required property
  - [CAT-1593] Drop invalid enum value from webhook event type
  - Add applicant_id in GET /workflow_runs
  - [CAT-1694] Define document file type as free text
  - Add missing import in ApiClient
  - [DOCCAP-2513] Add download-nfc-face endpoint
  - [CAT-1719] Don't impose a type on deprecated records property in watchlist reports
  - Remove documents property for reports where it's not applicable
  - Update openapi generator version to v7.10.0 (was v7.9.0)
  - Update openapi generator version to v7.11.0 (was v7.10.0)
- Add tests for Download NFC Face endpoint
- [Migration Guide](MIGRATION.md#upgrading-from-4x-to-5x)

**DEPRECATION NOTICE**: This release has been **deprecated** in favour of [v5.1.1](#v511-19th-may-2025).

## v4.6.0 24th January 2025

- Release based on Onfido OpenAPI spec version [v4.6.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v4.6.0):
  - [STUDIO-4308] Add driving_license to id_number enum
  - [CAT-1634] Add proxy configuration support to Java client library
  - Update README files (including templated ones)
  - Add customer_user_id in the webhook event resource
- test: wait for evidence folder to be available

**DEPRECATION NOTICE**: This release has been **deprecated** in favour of [v5.1.1](#v511-19th-may-2025).

## v4.5.0 8th January 2025

- Release based on Onfido OpenAPI spec version [v4.5.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v4.5.0):
  - [STUDIO-4305] Add download evidence folder path

**DEPRECATION NOTICE**: This release has been **deprecated** in favour of [v5.1.1](#v511-19th-may-2025).

## v4.4.0 20th December 2024

- Release based on Onfido OpenAPI spec version [v4.4.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v4.4.0):
  - [CAT-1593] Fix missing webhook type and evidence folder webhook
  - [CAT-1590] Allow any type for the workflow task output

**DEPRECATION NOTICE**: This release has been **deprecated** in favour of [v5.1.1](#v511-19th-may-2025).

## v4.3.0 27th November 2024

- Release based on Onfido OpenAPI spec version [v4.3.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v4.3.0):
  - [CAT-1581] Revert "[CAT-1528] Fix barcode field in document properties object"

**DEPRECATION NOTICE**: This release has been **deprecated** in favour of [v5.1.1](#v511-19th-may-2025).

## v4.2.0 19th November 2024

- Release based on Onfido OpenAPI spec version [v4.2.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v4.2.0):
  - feat: add new fields to facial similarity report objects
  - [CAT-1552] Add missing document types

**DEPRECATION NOTICE**: This release has been **deprecated** in favour of [v5.1.1](#v511-19th-may-2025).

## v4.1.0 8th November 2024

- Release based on Onfido OpenAPI spec version [v4.1.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v4.1.0):
  - [CAT-1528] Fix barcode field in document properties object

**DEPRECATION NOTICE**: This release has been **deprecated** in favour of [v5.1.1](#v511-19th-may-2025).

## v4.0.0 24th October 2024

- Release based on Onfido OpenAPI spec version [v4.0.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v4.0.0):
  - [CAT-1379] Add a few missing properties
  - [CAT-1447] Fix applicant consents
  - [CAT-1379] Fix check creation, remove some deprecated properties and deprecate others
  - Use document-type enum for document upload
  - [CAT-1306] Add webhooks event resource
  - Upgrade OpenAPI generator to v7.9.0 (was v7.6.0)
  - [Migration Guide](MIGRATION.md#upgrading-from-3x-to-4x)

**DEPRECATION NOTICE**: This release has been **deprecated** in favour of [v5.1.1](#v511-19th-may-2025).

## v3.4.0 20th September 2024

- Release based on Onfido OpenAPI spec version [v3.5.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v3.5.0):
  - [CAT-1376] Add record item object definition for watchlist enhanced properties field

## v3.3.1 22nd August 2024

- Release based on Onfido OpenAPI spec version [v3.3.1](https://github.com/onfido/onfido-openapi-spec/releases/tag/v3.3.1):
  - Including `faraday-follow_redirects` as a runtime dependency in ruby

## v3.3.0 24th July 2024

- Release based on Onfido OpenAPI spec version [v3.3.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v3.3.0):
  - Expose `customer_user_id` in `workflow_runs`
  - Add `sdk_token` to workflow run schema

## v3.2.0 18th July 2024

- Release based on Onfido OpenAPI spec version [v3.2.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v3.2.0):
  - [CAT-1289] Document report's properties: Add middle name
  - chore(qes): add documents endpoint
  - [CAT-1297] Webhook Event: remove uuid format from object.id
  - fix(qes): fix download document http method
  - Add started_at_iso8601 field in webhook event
  - add jpeg file type for documents
- Fix error handling documentation in README file

## v3.1.0 5th July 2024

- Release based on Onfido OpenAPI spec version [v3.1.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v3.1.0):
  - Add missing fields in document report's properties

## v3.0.0 24th June 2024

- Library has been rebuilt from scratch and automatically generated on [Onfido OpenAPI Spec](https://github.com/onfido/onfido-openapi-spec) (release [v3.0.0](https://github.com/onfido/onfido-openapi-spec/releases/tag/v3.0.0))
- Integration tests have also been implemented

## v2.9.0 24 November 2023

- Added `signed_evidence_file` method for WorkflowRuns

## v2.8.0, 24 January 2023

- Updated to use API v3.6, for more details please see our [release notes](https://developers.onfido.com/release-notes#api-v36).
- Add Monitor support

## v2.7.0, 22 November 2022

- Added support for [Workflow Runs](https://documentation.onfido.com/#workflow-runs)

## v2.6.0, 22 November 2022

- Added support for [Monitors](https://documentation.onfido.com/#monitors)

## v2.5.0, 22 October 2022

- Added Motion capture support

## v2.4.0, 05 October 2022

- Updated to use API v3.5, for more details please see our [release notes](https://developers.onfido.com/release-notes#api-v35).

## v2.3.0, 02 March 2022

- Updated to use API v3.4, for more details please see our [release notes](https://developers.onfido.com/release-notes#api-v34).

## v2.2.0, 02 March 2022

- Support Onfido API version 3.3

## v2.1.1, 01 February 2022

- Send params as json
- Remove .travis.yml
- Update README.md link

## v2.1.0, 23 June 2021

- Support Onfido API version 3.2

## v2.0.2, 10 June 2021

- Add error coverage for errors RestClient:BadGateway

## v2.0.1, 27 May 2021

- Remove onfido/null_logger

## v2.0.0, 5 May 2021

- Remove global configuration, all configuration is now per `Onfido::API` instance
- Region is now a required argument (it previously defaulted to `:eu`)
- Support Onfido API version 3.1
- Drop support for Ruby 2.2 and 2.3

## v1.1.1, 12 March 2021

- Send the postcode in the query string for the address picker endpoint

## v1.1.0, 14 Aug 2020

- Add User-Agent header
- Add support for CA region
- Add extractions endpoint
- Add webhook deletion endpoint

## v1.0.0, 13 Jan 2020

- Support Onfido API version 3
- Drop support for Onfido API version 2
- To upgrade from 0.15.0 see the v2 to v3 migration [guide](https://developers.onfido.com/guide/v2-to-v3-migration-guide)

## v0.15.0, 4 Feb 2019

- Add Check#find_by_url method (@ctrlaltdylan)

## v0.14.0, 28 Jan 2019

- Add support for applicant deletion and restore endpoints

## v0.13.0, 5 Nov 2018

- Add support for region-specific environments (@stephencookdev)

## v0.12.0, 29 May 2018

- Add support for the Live Video resource (#55) (@Intrepidd)

## v0.11.0, 18 April 2018

- Automatically detect the correct Onfido API region to use based on the provided API
  key (#49) (@tpinto)

## v0.10.0, 3 April 2018

- Add support for download, find and retrieve all for live_photo resource (@kirsis)

## v0.9.0, 8 March 2018

- Remove the ability to create Documents and Live Photos from a remote URL or local path, mitigating a potential security vulnerability (see #45 for details) (@timrogers)
- Drop support for Ruby versions earlier than 2.2.0, since they have [reached end-of-life](https://www.ruby-lang.org/en/news/2017/04/01/support-of-ruby-2-1-has-ended/) (@timrogers)

## v0.8.4, 29 January 2018

- Replace use of `method_missing` with explicitly-defined accessors when accessing
  resources from an `Onfido::API` instance (@hmac)

## v0.8.3, 16 January 2018

- Add support for `Onfido::SdkToken` resource (@robotmay)

## v0.8.2, 21 April 2017

- Relax [Rack](https://github.com/rack/rack) dependency to allow all versions where `Rack::Utils.secure_compare` is available (@metade)

## v0.8.1, 5 April 2017

- Fix `Content-Type` header handling to be more permissive when detecting JSON (e.g. still recognise the type as JSON when the charset is appended to the header) (@sponomarev)
- Update [`rest-client`](https://github.com/rest-client/rest-client) dependency to 2.x (@timrogers)
- Update [`WebMock`](https://github.com/bblimke/webmock) dependendency to 2.x (@timrogers)

## v0.8.0, 16 November 2016

- Add support for `put` and `delete` http methods to `Onfido::Resource`
- Support no content and binary responses at `Onfido::Resource`
- Add support for `Onfido::ReportTypeGroup` resource
- Add support for update and destroy applicant resource
- Add support for download, find and retrieve all for document resource
- Add support for resume checks
- Add support for resume and cancel report

## v0.7.1, 5 September 2016

- Fix creation of live photos through `Onfido::LivePhoto` resource

## v0.7.0, 8 August 2016

- Add support for dynamic API keys
  (see https://github.com/hvssle/onfido#usage)
- Fix `Onfido::Resource` so it raises `Onfido::ConnectionError` on
  HTTP Error 408 Request Timeout

## v0.6.1, 15 July 2016

- Fix `Onfido::API.live_photo` so it returns an `Onfido::LivePhoto` instance
  (see https://github.com/hvssle/onfido/pull/14)

## v0.6.0, 7 July 2016

- Add `expand` option to `Onfido::Check.find` and `Onfido::Check.all`. See
  https://github.com/hvssle/onfido/pull/11 for details.

## v0.5.0, 7 June 2016

- Add `Onfido::Webhook.valid?` method, for checking the signature of a webhook
  from Onfido

## v0.4.0, 12 May 2016

- BREAKING: target v2 of the Onfido API. To continue using v1, specify this
  version in `Onfido.configure`
- Add `api_version` configuration option
  (see https://github.com/hvssle/onfido#configuration)
- Add support for `Onfido::LivePhoto` resource

## v0.3.0, 16 March 2016

- Add support for `Onfido::Webhook` resource

## v0.2.0, 9 February 2016

- BREAKING: adds `Onfido::ServerError`, which is raised whenever Onfido responds
  with a 5xx code. Previously `Onfido::RequestError` would have been raised, but
  this is now reserved for non-5xx responses.

## v0.1.0, 11 November 2015

- BREAKING: remove `throws_exceptions` option. We now always throw exceptions
  for errors. This option had become confusing since `Onfido::ConnectionError`
  was added in v0.0.4, since timeout errors were raised regardless of its value.
- Add base errors class (`Onfido::OnfidoError`)
- Add rubocop, and fix style inconsistencies

## v0.0.4, 10 November 2015

- Split out connection errors so they can be automatically retried
