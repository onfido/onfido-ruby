describe Onfido::Resource do
  let(:resource) { described_class.new }
  let(:api_key) { 'some_key' }
  let(:payload) { { postcode: 'SE1 4NG' } }

  before { allow(Onfido).to receive(:api_key).and_return(api_key) }

  context '4xx response' do
    it 'raises a custom error' do
      path = '4xx_response'

      expect { resource.get(path: path, payload: payload) }.
        to raise_error(Onfido::RequestError, 'Something went wrong')
    end
  end

  context 'unexpected error format' do
    it 'raises a custom error' do
      path = 'unexpected_error_format'

      expect { resource.get(path: path, payload: payload) }.
        to raise_error(Onfido::RequestError, /response code was 400/)
    end
  end

  context 'unparseable JSON 5xx' do
    it 'raises a server error' do
      path = 'unparseable_response'

      expect { resource.get(path: path, payload: payload) }.
        to raise_error(Onfido::ServerError, /response code was 504/)
    end
  end

  context 'timeout' do
    before do
      allow(RestClient::Request).
        to receive(:execute).
        and_raise(RestClient::RequestTimeout)
    end

    it 'raises a ConnectionError' do
      expect { resource.get(path: Onfido.endpoint, payload: payload) }.
        to raise_error(Onfido::ConnectionError, /Could not connect/)
    end
  end

  context 'broken connection' do
    before do
      allow(RestClient::Request).
        to receive(:execute).
        and_raise(RestClient::ServerBrokeConnection)
    end

    it 'raises a ConnectionError' do
      expect { resource.get(path: Onfido.endpoint, payload: payload) }.
        to raise_error(Onfido::ConnectionError, /connection to the server/)
    end
  end

  context "bad SSL certificate" do
    before do
      allow(RestClient::Request).
        to receive(:execute).
        and_raise(RestClient::SSLCertificateNotVerified.new(nil))
    end

    it 'raises a ConnectionError' do
      expect { resource.get(path: Onfido.endpoint, payload: payload) }.
        to raise_error(Onfido::ConnectionError, /SSL certificate/)
    end
  end
end
