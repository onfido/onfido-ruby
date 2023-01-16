# frozen_string_literal: true

describe Onfido::Monitor do
  include_context 'fake onfido api'

  subject(:monitor) { onfido.monitor }

  let(:monitor_id) { '2748c4fc-c6b8-4c1e-a383-21efa241ce1e' }

  describe '#create' do
    let(:applicant_id) { '61f659cb-c90b-4067-808a-6136b5c01351' }
    let(:report_name) { 'watchlist_standard' }

    it 'creates a monitor for the applicant' do
      response = monitor.create(applicant_id: applicant_id, report_name: report_name)
      expect(response).to be_a(Hash).and include('id' => monitor_id, 'report_name' => report_name)
    end
  end

  describe '#find' do
    it 'returns the expected monitor' do
      response = monitor.find(monitor_id)

      expect(response).to be_a(Hash).and include('id' => monitor_id)
    end
  end

  describe '#all' do
    it 'returns a list of monitors' do
      applicant_id = '1030303-123123-123123'
      response = monitor.all(applicant_id)

      expect(response['monitors']).to be_an(Array).and contain_exactly(an_instance_of(Hash))
    end
  end

  describe '#destroy' do
    it 'returns success code' do
      expect { monitor.destroy(monitor_id) }.not_to raise_error
    end
  end

  describe '#list_matches' do
    subject(:list_matches) { monitor.list_matches(monitor_id) }

    it do
      is_expected
        .to include('matches' => [hash_including('id' => anything, 'enabled' => true), anything])
    end

    context 'when the monitor_id does not exist' do
      let(:monitor_id) { '00000000-c6b8-4c1e-a383-21efa241ce1e' }

      it 'raises an error' do
        expect { list_matches }.to raise_error(Onfido::RequestError, /404/)
      end
    end
  end

  describe '#set_match_status' do
    subject(:set_match_status) { monitor.set_match_status(monitor_id, **payload) }

    let(:payload) do
      {
        disabled: ['925e47d3-9e21-48d4-b570-9564c4282cec'],
        enabled: ['37afcacb-5ff0-4b09-831d-5bcc672ca1fb']
      }
    end

    it do
      is_expected
        .to include('matches' => [hash_including('id' => anything, 'enabled' => true), anything])
    end

    context 'when a match id is both in enabled and disabled' do
      before { payload[:disabled] << payload[:enabled][0] }

      it 'raises an error' do
        expect { set_match_status }
          .to raise_error(
            an_instance_of(Onfido::RequestError).and(having_attributes(response_code: 422))
          )
      end
    end

    context 'when not passing any enabled or disabled ids' do
      let(:payload) { {} }

      it { is_expected.to be_nil }
    end

    context 'when the monitor_id does not exist' do
      let(:monitor_id) { '00000000-c6b8-4c1e-a383-21efa241ce1e' }

      it 'raises an error' do
        expect { set_match_status }.to raise_error(Onfido::RequestError, /404/)
      end
    end
  end
end
