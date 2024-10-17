# frozen_string_literal: true
require 'onfido'

describe Onfido::ApiClient do
  describe '#user agent header' do
    it 'contains a user agent header' do
      expect(subject.default_headers['User-Agent']).to match(/^onfido-ruby\/\d+\.\d+\.\d+$/)
    end
  end
end