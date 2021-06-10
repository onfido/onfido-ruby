# frozen_string_literal: true

class TestResource < Onfido::Resource
  def get(path:)
    super(path: path)
  end
end

describe Onfido::Resource do
  include_context 'fake onfido api'

  subject(:resource) { TestResource.new(Onfido::Options.new(api_key: 'test', region: :eu)) }

  context '4xx response' do
    it 'raises a custom error' do
      path = '4xx_response'

      expect { resource.get(path: path) }
        .to raise_error(Onfido::RequestError, 'Something went wrong')
    end
  end

  context 'unexpected error format' do
    it 'raises a custom error' do
      path = 'unexpected_error_format'

      expect { resource.get(path: path) }
        .to raise_error(Onfido::RequestError, /response code was 400/)
    end
  end

  context 'unparseable JSON 5xx' do
    it 'raises a server error' do
      path = 'unparseable_response'

      expect { resource.get(path: path) }
        .to raise_error(Onfido::ServerError, /response code was 504/)
    end
  end

  context 'timeout' do
    before do
      allow(RestClient::Request)
        .to receive(:execute)
        .and_raise(RestClient::RequestTimeout)
    end

    it 'raises a ConnectionError' do
      expect { resource.get(path: '') }
        .to raise_error(Onfido::ConnectionError, /Could not connect/)
    end
  end

  context 'RestClient : BadGateway' do
    before do
      allow(RestClient::Request)
        .to receive(:execute)
        .and_raise(RestClient::BadGateway)
    end

    it 'raises a ConnectionError' do
      expect { resource.get(path: '') }
        .to raise_error(Onfido::ConnectionError, /Could not connect/)
    end
  end

  context 'broken connection' do
    before do
      allow(RestClient::Request)
        .to receive(:execute)
        .and_raise(RestClient::ServerBrokeConnection)
    end

    it 'raises a ConnectionError' do
      expect { resource.get(path: '') }
        .to raise_error(Onfido::ConnectionError, /connection to the server/)
    end
  end

  context 'bad SSL certificate' do
    before do
      allow(RestClient::Request)
        .to receive(:execute)
        .and_raise(RestClient::SSLCertificateNotVerified.new(nil))
    end

    it 'raises a ConnectionError' do
      expect { resource.get(path: '') }
        .to raise_error(Onfido::ConnectionError, /SSL certificate/)
    end
  end

  context 'with a timeout error response' do
    before do
      allow_any_instance_of(RestClient::ExceptionWithResponse)
        .to receive(:response).and_return(double(body: '', code: '408'))
      expect(RestClient::Request).to receive(:execute)
        .and_raise(RestClient::ExceptionWithResponse)
    end

    it 'raises a ConnectionError' do
      expect { resource.get(path: '') }
        .to raise_error(Onfido::ConnectionError)
    end
  end
end
