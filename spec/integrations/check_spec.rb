describe Onfido::Check do
  subject(:check) { described_class.new }
  let(:applicant_id) { '61f659cb-c90b-4067-808a-6136b5c01351' }
  let(:check_id) { '8546921-123123-123123' }

  describe '#create' do
    it 'creates a new check for an applicant' do
      response = check.create(
        applicant_id: applicant_id,
        report_names: ['identity_enhanced']
      )
      expect(response['id']).not_to be_nil
    end
  end

  describe '#find' do
    it 'returns an existing check for the applicant' do
      response = check.find(check_id)

      expect(response['id']).to eq(check_id)
    end

    it "returns report_ids" do
      response = check.find(check_id)

      expect(response['report_ids'].first).to be_a(String)
    end
  end

  describe '#all' do
    context 'with the default page and per page params' do
      it 'returns all existing checks for the applicant' do
        response = check.all(applicant_id)

        expect(response['checks'].size).to eq(1)
      end
    end

    it "returns report_ids" do
      response = check.all(applicant_id)

      expect(response['checks'].first['report_ids'].first).to be_a(String)
    end
  end

  describe "#resume" do
    it 'returns success response' do
      expect { check.resume(check_id) }.not_to raise_error
    end
  end

  describe '#download' do
  it 'returns the file data' do
    response = check.download(check_id)

    expect(response).not_to be_nil
  end
end
end
