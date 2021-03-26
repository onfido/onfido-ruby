# frozen_string_literal: true

describe Onfido do
  subject(:onfido) { described_class }
  after(:each) { onfido.reset }

  context 'configuration' do
    describe 'default values' do
      describe '.api_key' do
        subject { onfido.api_key }
        it { is_expected.to be_nil }
      end

      describe '.endpoint' do
        subject { onfido.endpoint }
        it { is_expected.to eq('https://api.onfido.com/v3.1/') }
      end

      describe '.logger' do
        subject { onfido.logger }
        it { is_expected.to be_an_instance_of(Onfido::NullLogger) }
      end
    end

    describe 'setting an API key' do
      it 'changes the configuration to the new value' do
        onfido.api_key = 'some_key'
        expect(onfido.api_key).to eq('some_key')
      end
    end

    describe 'using the US region' do
      it 'should change endpoint' do
        onfido.region = 'us'
        expect(onfido.endpoint).to eq('https://api.us.onfido.com/v3.1/')
      end
    end

    describe 'using the CA region' do
      it 'should change endpoint' do
        onfido.region = 'ca'
        expect(onfido.endpoint).to eq('https://api.ca.onfido.com/v3.1/')
      end
    end

    describe 'using an unsupported region' do
      it 'should change endpoint' do
        onfido.region = 'de'
        expect { onfido.endpoint }
          .to raise_error('The region "de" is not currently supported')
      end
    end

    describe 'using an old API token' do
      it 'should use old endpoint' do
        onfido.api_key = 'live_asdfghjkl1234567890qwertyuiop'
        expect(onfido.endpoint).to eq('https://api.onfido.com/v3.1/')
      end
    end

    describe '.logger' do
      context 'when an option is passed' do
        context 'when the option passed behaves like a logger' do
          let(:logger_like) { double('LoggerLike', :<< => nil) }

          it 'returns the option' do
            onfido.logger = logger_like
            expect(onfido.logger).to eq(logger_like)
          end
        end

        context 'when the option passed does not behave like a logger' do
          let(:non_logger) { double('NotLogger') }

          it 'raises an error' do
            expect { onfido.logger = non_logger }
              .to raise_error(
                "#{non_logger.class} doesn't seem to behave like a logger!"
              )
          end
        end
      end
    end
  end
end
