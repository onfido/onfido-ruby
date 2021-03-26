# frozen_string_literal: true

module Onfido
  class NullLogger
    def <<(*args); end
  end
end
