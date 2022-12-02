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

  it 'returns success code' do
    expect { monitor.destroy(monitor_id) }.not_to raise_error
  end
end
