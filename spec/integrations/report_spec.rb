describe Onfido::Report do
  subject(:report) { described_class.new }
  describe '#find' do
    it 'returns a report for an existing check' do
      report_id = '6951786-123123-422221'
      response = report.find(report_id)

      expect(response['id']).to eq(report_id)
    end
  end

  describe '#all' do
    it 'lists all reports for an existing check' do
      check_id = '8546921-123123-123123'
      response = report.all(check_id)

      expect(response['reports'].count).to eq(2)
    end
  end

  describe '#resume' do
    it 'returns a success response' do
      report_id = '6951786-123123-422221'

      expect { report.resume(report_id) }.not_to raise_error
    end
  end

  describe '#cancel' do
    it 'returns a success response' do
      report_id = '6951786-123123-422221'

      expect { report.cancel(report_id) }.not_to raise_error
    end
  end
end
