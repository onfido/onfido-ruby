# frozen_string_literal: true

require_relative '../shared_contexts/with_applicant'

describe Onfido::WatchlistMonitor do
  describe 'Watchlist monitor' do
    include_context 'with applicant'

    let(:watchlist_monitor_builder) do
      Onfido::WatchlistMonitorBuilder.new({
        applicant_id: applicant_id,
        report_name: Onfido::ReportName::WATCHLIST_STANDARD
      })
    end
    let(:watchlist_monitor) do
      onfido_api.create_watchlist_monitor(watchlist_monitor_builder)
    end
    let!(:watchlist_monitor_id) { watchlist_monitor.id }
    

    it 'creates a watchlist standard monitor' do
      expect(watchlist_monitor).to be_an_instance_of Onfido::WatchlistMonitor
      expect(watchlist_monitor.applicant_id).to eq applicant_id
      expect(watchlist_monitor.report_name).to eq Onfido::ReportName::WATCHLIST_STANDARD
    end

    context 'AML monitor' do
      let(:watchlist_monitor_builder) do
        Onfido::WatchlistMonitorBuilder.new({
          applicant_id: applicant_id,
          report_name: Onfido::ReportName::WATCHLIST_AML
        })
      end

      it 'creates a watchlist AML monitor' do
        expect(watchlist_monitor).to be_an_instance_of Onfido::WatchlistMonitor
        expect(watchlist_monitor.applicant_id).to eq applicant_id
        expect(watchlist_monitor.report_name).to eq Onfido::ReportName::WATCHLIST_AML
      end
    end

    it 'lists watchlist monitors' do
      list_of_monitors = onfido_api.list_watchlist_monitors(applicant_id)

      expect(list_of_monitors).to be_an_instance_of Onfido::WatchlistMonitorsList
      expect(list_of_monitors.monitors.size).to be > 0
    end

    it 'finds a watchlist monitor' do
      get_watchlist_monitor = onfido_api.find_watchlist_monitor(watchlist_monitor_id)

      expect(get_watchlist_monitor.id).to eq watchlist_monitor_id
    end

    it 'deletes a watchlist monitor' do
      onfido_api.delete_watchlist_monitor(watchlist_monitor_id)
    end

    it 'lists watchlist monitor matches' do
      matches_list = onfido_api.list_watchlist_monitor_matches(watchlist_monitor_id)
      
      expect(matches_list).to be_an_instance_of Onfido::WatchlistMonitorMatchesList
      expect(matches_list.matches.size).to eq 0
    end

    it 'forces report creation' do
      onfido_api.force_report_creation_from_watchlist_monitor(watchlist_monitor_id)

      checks = onfido_api.list_checks(applicant_id).checks
      expect(checks.size).to eq 2
    end
  end
end
