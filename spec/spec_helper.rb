# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'onfido'
require 'rspec/its'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    # be_bigger_than(2).and_smaller_than(4).description
    #   # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #   # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.order = :random
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.disable_monkey_patching!
  config.raise_errors_for_deprecations!
  config.warnings = false
  config.expose_dsl_globally = true

  config.after(:suite) do
    # clean-up applicants and webhooks
    sample_applicant_id = ENV['ONFIDO_SAMPLE_APPLICANT_ID']
    onfido_api = Onfido::DefaultApi.new

    applicants = onfido_api.list_applicants(
      page: 1,
      per_page: 100,
      include_deleted: false,
    ).applicants

    applicants.each do |applicant|
      if applicant.id != sample_applicant_id
        begin
          onfido_api.delete_applicant(applicant.id)
        rescue Onfido::ApiError
          # ignore failures during cleanup
        end
      end
    end

    webhooks = onfido_api.list_webhooks().webhooks

    webhooks.each do |webhook|
      begin
        onfido_api.delete_webhook(webhook.id)
      rescue Onfido::ApiError
        # ignore failures during cleanup
      end
    end
  end

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
end

def repeat_request_until_status_changes(expected_status, max_retries = 15,
  interval = 1, &proc)
  # expected_status --> desired status
  # max_retries     --> how many times to retry the request
  # interval        --> how many seconds to wait until the next retry
  # proc            --> code containing the request

  instance = proc.call

  iteration = 0
  while instance.status != expected_status
    raise "status did not change in time" if iteration > max_retries

    iteration += 1
    sleep(interval)
    instance = proc.call
  end

  instance
end

def repeat_request_until_task_output_changes(max_retries = 15,
  interval = 1, &proc)
  # max_retries     --> how many times to retry the request
  # interval        --> how many seconds to wait until the next retry
  # proc            --> code containing the request

  instance = proc.call

  iteration = 0
  while instance.output == nil
    raise "task output did not change in time" if iteration > max_retries

    iteration += 1
    sleep(interval)
    instance = proc.call
  end

  instance
end

def repeat_request_unti_http_code_changes(max_retries = 15,
  interval = 1, &proc)
  # max_retries        --> how many times to retry the request
  # interval           --> how many seconds to wait until the next retry
  # proc               --> code containing the request

  iteration = 0
  while iteration <= max_retries
    begin
      instance = proc.call
      break
    rescue Onfido::ApiError
      sleep(interval)
      iteration += 1
    end
  end

  instance
end
