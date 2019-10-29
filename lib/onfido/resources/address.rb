module Onfido
  class Address < Resource
    def all(postcode)
      get(
        url: 'addresses/pick',
        payload: { postcode: postcode.delete(' ') }
      )
    end
  end
end
