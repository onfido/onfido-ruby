# frozen_string_literal: true

describe Onfido::API do
  before do
    allow(Onfido::Options).to receive(:new).and_call_original
  end

  let(:options) do
    {
      api_key: 'test',
      region: :eu,
      open_timeout: 1,
      read_timeout: 2
    }
  end

  it 'passes through options' do
    described_class.new(**options)

    expect(Onfido::Options).to have_received(:new).with(**options)
  end
end
