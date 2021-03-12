module Onfido
  class Address < Resource
    def all(postcode)
      get(path: "addresses/pick?postcode=#{postcode.delete(' ')}")
    end
  end
end
