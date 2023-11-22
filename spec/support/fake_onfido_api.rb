# frozen_string_literal: true

require 'sinatra/base'

RSpec.shared_context 'fake onfido api' do
  let(:onfido) { Onfido::API.new(api_key: 'test', region: :eu) }

  before { stub_request(:any, /api.eu.onfido.com/).to_rack(FakeOnfidoAPI) }
end

class FakeOnfidoAPI < Sinatra::Base # rubocop:disable Metrics/ClassLength
  before do
    begin
      if request.content_type == 'application/json; charset=utf-8'
        body_parameters = JSON.parse(request.body.read)
        params.merge!(body_parameters) if body_parameters
      end
    rescue JSON::ParserError
    end
  end

  get '/v3.6/addresses/pick' do
    json_response(200, 'addresses.json')
  end

  post '/v3.6/applicants' do
    json_response(201, 'applicant.json')
  end

  put '/v3.6/applicants/:id' do
    json_response(200, 'applicant.json')
  end

  get '/v3.6/applicants/:id' do
    json_response(200, 'applicant.json')
  end

  get '/v3.6/applicants' do
    response = json_response(200, 'applicants.json')
    { applicants: JSON.parse(response)['applicants'][pagination_range] }.to_json
  end

  delete '/v3.6/applicants/:id' do
    status 204
  end

  post '/v3.6/applicants/:id/restore' do
    if params['id'] == 'a2fb9c62-ab10-4898-a8ec-342c4b552ad5'
      json_response(422, 'not_scheduled_for_deletion_error.json')
    else
      status 204
    end
  end

  post '/v3.6/documents' do
    json_response(201, 'document.json')
  end

  post '/v3.6/extractions' do
    json_response(201, 'extraction.json')
  end

  get '/v3.6/documents/:id' do
    json_response(200, 'document.json')
  end

  get '/v3.6/documents' do
    json_response(200, 'documents.json')
  end

  get '/v3.6/documents/:id/download' do
    status 200
    content_type 'application/octet-stream'
    "\x01\x02\x03" # acts as binary file data
  end

  post '/v3.6/live_photos' do
    json_response(201, 'live_photo.json')
  end

  get '/v3.6/live_photos/:id' do
    json_response(200, 'live_photo.json')
  end

  get '/v3.6/live_photos' do
    if params['applicant_id'] == '1030303-123123-123123'
      json_response(200, 'live_photos.json')
    else
      status 404
    end
  end

  get '/v3.6/live_photos/:id/download' do
    status 200
    content_type 'image/jpeg'
    "\x01\x02\x03" # acts as binary file data
  end

  get '/v3.6/live_videos/:id' do
    json_response(200, 'live_video.json')
  end

  get '/v3.6/live_videos' do
    if params['applicant_id'] == '1030303-123123-123123'
      json_response(200, 'live_videos.json')
    else
      status 404
    end
  end

  get '/v3.6/live_videos/:id/download' do
    status 200
    content_type 'video/quicktime'
    "\x01\x02\x03" # acts as binary file data
  end

  post '/v3.6/watchlist_monitors' do
    json_response(201, 'monitor.json')
  end

  get '/v3.6/watchlist_monitors/:id' do
    json_response(200, 'monitor.json')
  end

  get '/v3.6/watchlist_monitors' do
    if params['applicant_id'] == '1030303-123123-123123'
      json_response(200, 'monitors.json')
    else
      status 404
    end
  end

  delete '/v3.6/watchlist_monitors/:id' do
    status 204
  end

  get '/v3.6/watchlist_monitors/:monitor_id/matches' do
    if params['monitor_id'] == '2748c4fc-c6b8-4c1e-a383-21efa241ce1e'
      json_response(200, 'monitor_matches.json')
    else
      status 404
    end
  end

  patch '/v3.6/watchlist_monitors/:monitor_id/matches' do
    if params['monitor_id'] == '2748c4fc-c6b8-4c1e-a383-21efa241ce1e'
      enabled, disabled = params.values_at('enabled', 'disabled')
      if enabled&.any? || disabled&.any?
        if (enabled.to_a & disabled.to_a).any?
          json_response(422, '4xx_response.json')
        else
          json_response(200, 'monitor_matches.json')
        end
      else
        status 204
      end
    else
      status 404
    end
  end

  get '/v3.6/motion_captures/:id' do
    json_response(200, 'motion_capture.json')
  end

  get '/v3.6/motion_captures' do
    if params['applicant_id'] == '1030303-123123-123123'
      json_response(200, 'motion_captures.json')
    else
      status 404
    end
  end

  get '/v3.6/motion_captures/:id/download' do
    status 200
    content_type 'video/mp4'
    "\x01\x02\x03" # acts as binary file data
  end

  get '/v3.6/motion_captures/:id/frame' do
    status 200
    content_type 'image/jpeg'
    "\x01\x02\x03" # acts as binary file data
  end

  post '/v3.6/checks' do
    params['applicant_id'].nil? ? status(422) : json_response(201, 'check.json')
  end

  get '/v3.6/checks/:id' do
    json_response(200, 'check.json')
  end

  get '/v3.6/checks' do
    json_response(200, 'checks.json')
  end

  post '/v3.6/checks/:id/resume' do
    status 204 # no_content
  end

  get '/v3.6/checks/:id/download' do
    status 200
    content_type 'application/pdf'
    "\x01\x02\x03" # acts as binary file data
  end

  get '/v3.6/reports' do
    json_response(200, 'reports.json')
  end

  get '/v3.6/reports/:id' do
    json_response(200, 'report.json')
  end

  post '/v3.6/reports/:id/resume' do
    status 204
  end

  post '/v3.6/reports/:id/cancel' do
    status 204
  end

  post '/v3.6/sdk_token' do
    json_response(201, 'sdk_token.json')
  end

  post '/v3.6/webhooks' do
    json_response(201, 'webhook.json')
  end

  get '/v3.6/webhooks/:id' do
    json_response(200, 'webhook.json')
  end

  delete '/v3.6/webhooks/:id' do
    status 204
  end

  get '/v3.6/webhooks' do
    json_response(200, 'webhooks.json')
  end

  post '/v3.6/workflow_runs' do
    json_response(201, 'workflow_run.json')
  end

  get '/v3.6/workflow_runs/:id' do
    json_response(200, 'workflow_run.json')
  end

  get '/v3.6/workflow_runs/:id/signed_evidence_file' do
    pdf_response(200, 'signed_workflow_run.pdf')
  end

  get '/v3.6/workflow_runs' do
    json_response(200, 'workflow_runs.json')
  end

  get '/v3.6/4xx_response' do
    json_response(422, '4xx_response.json')
  end

  get '/v3.6/unexpected_error_format' do
    json_response(400, 'unexpected_error_format.json')
  end

  get '/v3.6/unparseable_response' do
    content_type :json
    status 504
    ''
  end

  private

  def json_response(response_code, file_name)
    fixture_response(response_code, file_name, 'application/json')
  end

  def fixture_response(response_code, file_name, custom_content_type)
    content_type "#{custom_content_type}; charset=utf-8"
    status response_code
    File.binread("#{File.dirname(__FILE__)}/fixtures/#{file_name}")
  end

  def pdf_response(response_code, file_name)
    fixture_response(response_code, file_name, 'application/pdf')
  end

  def pagination_range
    start = (params.fetch('page').to_i - 1) * 20
    limit = start + params.fetch('per_page').to_i - 1
    start..limit
  end
end
