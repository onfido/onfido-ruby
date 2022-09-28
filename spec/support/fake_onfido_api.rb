# frozen_string_literal: true

require 'sinatra/base'

RSpec.shared_context 'fake onfido api' do
  let(:onfido) { Onfido::API.new(api_key: 'test', region: :eu) }

  before { stub_request(:any, /api.eu.onfido.com/).to_rack(FakeOnfidoAPI) }
end

class FakeOnfidoAPI < Sinatra::Base # rubocop:disable Metrics/ClassLength
  before do
    begin
      if request.content_type == "application/json; charset=utf-8"
        body_parameters = JSON.parse(request.body.read)
        params.merge!(body_parameters) if body_parameters
      end
    rescue JSON::ParserError
    end
  end

  get '/v3.5/addresses/pick' do
    json_response(200, 'addresses.json')
  end

  post '/v3.5/applicants' do
    json_response(201, 'applicant.json')
  end

  put '/v3.5/applicants/:id' do
    json_response(200, 'applicant.json')
  end

  get '/v3.5/applicants/:id' do
    json_response(200, 'applicant.json')
  end

  get '/v3.5/applicants' do
    response = json_response(200, 'applicants.json')
    { applicants: JSON.parse(response)['applicants'][pagination_range] }.to_json
  end

  delete '/v3.5/applicants/:id' do
    status 204
  end

  post '/v3.5/applicants/:id/restore' do
    if params['id'] == 'a2fb9c62-ab10-4898-a8ec-342c4b552ad5'
      json_response(422, 'not_scheduled_for_deletion_error.json')
    else
      status 204
    end
  end

  post '/v3.5/documents' do
    json_response(201, 'document.json')
  end

  post '/v3.5/extractions' do
    json_response(201, 'extraction.json')
  end

  get '/v3.5/documents/:id' do
    json_response(200, 'document.json')
  end

  get '/v3.5/documents' do
    json_response(200, 'documents.json')
  end

  get '/v3.5/documents/:id/download' do
    status 200
    content_type 'application/octet-stream'
    "\x01\x02\x03" # acts as binary file data
  end

  post '/v3.5/live_photos' do
    json_response(201, 'live_photo.json')
  end

  get '/v3.5/live_photos/:id' do
    json_response(200, 'live_photo.json')
  end

  get '/v3.5/live_photos' do
    if params['applicant_id'] == '1030303-123123-123123'
      json_response(200, 'live_photos.json')
    else
      status 404
    end
  end

  get '/v3.5/live_photos/:id/download' do
    status 200
    content_type 'image/jpeg'
    "\x01\x02\x03" # acts as binary file data
  end

  get '/v3.5/live_videos/:id' do
    json_response(200, 'live_video.json')
  end

  get '/v3.5/live_videos' do
    if params['applicant_id'] == '1030303-123123-123123'
      json_response(200, 'live_videos.json')
    else
      status 404
    end
  end

  get '/v3.5/live_videos/:id/download' do
    status 200
    content_type 'video/quicktime'
    "\x01\x02\x03" # acts as binary file data
  end

  post '/v3.5/watchlist_monitors' do
    json_response(201, 'monitor.json')
  end

  get '/v3.5/watchlist_monitors/:id' do
    json_response(200, 'monitor.json')
  end

  get '/v3.5/watchlist_monitors' do
    if params['applicant_id'] == '1030303-123123-123123'
      json_response(200, 'monitors.json')
    else
      status 404
    end
  end

  delete '/v3.5/watchlist_monitors/:id' do
    status 204
  end

  get '/v3.5/motion_captures/:id' do
    json_response(200, 'motion_capture.json')
  end

  get '/v3.5/motion_captures' do
    if params['applicant_id'] == '1030303-123123-123123'
      json_response(200, 'motion_captures.json')
    else
      status 404
    end
  end

  get '/v3.5/motion_captures/:id/download' do
    status 200
    content_type 'video/mp4'
    "\x01\x02\x03" # acts as binary file data
  end

  get '/v3.5/motion_captures/:id/frame' do
    status 200
    content_type 'image/jpeg'
    "\x01\x02\x03" # acts as binary file data
  end

  post '/v3.5/checks' do
    params['applicant_id'].nil? ? status(422) : json_response(201, 'check.json')
  end

  get '/v3.5/checks/:id' do
    json_response(200, 'check.json')
  end

  get '/v3.5/checks' do
    json_response(200, 'checks.json')
  end

  post '/v3.5/checks/:id/resume' do
    status 204 # no_content
  end

  get '/v3.5/checks/:id/download' do
    status 200
    content_type 'application/pdf'
    "\x01\x02\x03" # acts as binary file data
  end

  get '/v3.5/reports' do
    json_response(200, 'reports.json')
  end

  get '/v3.5/reports/:id' do
    json_response(200, 'report.json')
  end

  post '/v3.5/reports/:id/resume' do
    status 204
  end

  post '/v3.5/reports/:id/cancel' do
    status 204
  end

  post '/v3.5/sdk_token' do
    json_response(201, 'sdk_token.json')
  end

  post '/v3.5/webhooks' do
    json_response(201, 'webhook.json')
  end

  get '/v3.5/webhooks/:id' do
    json_response(200, 'webhook.json')
  end

  delete '/v3.5/webhooks/:id' do
    status 204
  end

  get '/v3.5/webhooks' do
    json_response(200, 'webhooks.json')
  end

  post '/v3.5/workflow_runs' do
    json_response(201, 'workflow_run.json')
  end

  get '/v3.5/workflow_runs/:id' do
    json_response(200, 'workflow_run.json')
  end

  get '/v3.5/workflow_runs' do
    json_response(200, 'workflow_runs.json')
  end

  get '/v3.5/4xx_response' do
    json_response(422, '4xx_response.json')
  end

  get '/v3.5/unexpected_error_format' do
    json_response(400, 'unexpected_error_format.json')
  end

  get '/v3.5/unparseable_response' do
    content_type :json
    status 504
    ''
  end

  private

  def json_response(response_code, file_name)
    content_type 'application/json; charset=utf-8'
    status response_code
    File.open("#{File.dirname(__FILE__)}/fixtures/#{file_name}", 'rb').read
  end

  def pagination_range
    start = (params.fetch('page').to_i - 1) * 20
    limit = start + params.fetch('per_page').to_i - 1
    start..limit
  end
end
