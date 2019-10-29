module Onfido
  class Address < Resource
    def all(postcode)
      get(
        path: 'addresses/pick',
        payload: { postcode: postcode.delete(' ') }
      )
    end
  end
end
