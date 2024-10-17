# frozen_string_literal: true
require 'onfido'

describe Onfido::Configuration do
  describe '#authorization header' do
    it 'sets the authorization header from the given token' do
      subject.api_token = 'api_token'

      expect(subject.api_key).to eq ({'Token'=> 'Token token=api_token'})
    end
  end

  describe '#region selection' do
    it 'allows setting the EU region' do
      subject.region = Onfido::Configuration::REGIONS[:EU]

      expect(subject.base_url).to eq ("https://api.eu.onfido.com/v3.6")
    end

    it 'allows setting the US region' do
      subject.region = Onfido::Configuration::REGIONS[:US]

      expect(subject.base_url).to eq ("https://api.us.onfido.com/v3.6")
    end

    it 'allows setting the CA region' do
      subject.region = Onfido::Configuration::REGIONS[:CA]

      expect(subject.base_url).to eq ("https://api.ca.onfido.com/v3.6")
    end

    it 'use EU region if region was not provided' do
      expect(subject.base_url).to eq ("https://api.eu.onfido.com/v3.6")
    end

    it 'throws an error for unknown regions' do
      subject.region = "abc"
      expect{
        subject.base_url
      }.to raise_error(ArgumentError)
    end

  end

  describe '#timeout' do
    it 'allows changing the default timeout' do
      subject.timeout = 123

      expect(subject.timeout).to eq (123)
    end
  end
end