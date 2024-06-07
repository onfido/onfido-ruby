=begin
#Onfido API v3.6

#The Onfido API (v3.6)

The version of the OpenAPI document: v3.6

Generated by: https://openapi-generator.tech
Generator version: 7.6.0

=end

require 'date'
require 'time'

module Onfido
  class AddressShared
    # The flat number of this address
    attr_accessor :flat_number

    # The building number of this address
    attr_accessor :building_number

    # The building name of this address
    attr_accessor :building_name

    # The street of the applicant's address
    attr_accessor :street

    # The sub-street of the applicant's address
    attr_accessor :sub_street

    # The town of the applicant's address
    attr_accessor :town

    # The postcode or ZIP of the applicant's address
    attr_accessor :postcode

    # The 3 character ISO country code of this address. For example, GBR is the country code for the United Kingdom
    attr_accessor :country

    # The address state. US states must use the USPS abbreviation (see also ISO 3166-2:US), for example AK, CA, or TX.
    attr_accessor :state

    # Line 1 of the applicant's address
    attr_accessor :line1

    # Line 2 of the applicant's address
    attr_accessor :line2

    # Line 3 of the applicant's address
    attr_accessor :line3

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'flat_number' => :'flat_number',
        :'building_number' => :'building_number',
        :'building_name' => :'building_name',
        :'street' => :'street',
        :'sub_street' => :'sub_street',
        :'town' => :'town',
        :'postcode' => :'postcode',
        :'country' => :'country',
        :'state' => :'state',
        :'line1' => :'line1',
        :'line2' => :'line2',
        :'line3' => :'line3'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'flat_number' => :'String',
        :'building_number' => :'String',
        :'building_name' => :'String',
        :'street' => :'String',
        :'sub_street' => :'String',
        :'town' => :'String',
        :'postcode' => :'String',
        :'country' => :'CountryCodes',
        :'state' => :'String',
        :'line1' => :'String',
        :'line2' => :'String',
        :'line3' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'line1',
        :'line2',
        :'line3'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Onfido::AddressShared` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Onfido::AddressShared`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'flat_number')
        self.flat_number = attributes[:'flat_number']
      end

      if attributes.key?(:'building_number')
        self.building_number = attributes[:'building_number']
      end

      if attributes.key?(:'building_name')
        self.building_name = attributes[:'building_name']
      end

      if attributes.key?(:'street')
        self.street = attributes[:'street']
      end

      if attributes.key?(:'sub_street')
        self.sub_street = attributes[:'sub_street']
      end

      if attributes.key?(:'town')
        self.town = attributes[:'town']
      end

      if attributes.key?(:'postcode')
        self.postcode = attributes[:'postcode']
      else
        self.postcode = nil
      end

      if attributes.key?(:'country')
        self.country = attributes[:'country']
      else
        self.country = nil
      end

      if attributes.key?(:'state')
        self.state = attributes[:'state']
      end

      if attributes.key?(:'line1')
        self.line1 = attributes[:'line1']
      end

      if attributes.key?(:'line2')
        self.line2 = attributes[:'line2']
      end

      if attributes.key?(:'line3')
        self.line3 = attributes[:'line3']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @postcode.nil?
        invalid_properties.push('invalid value for "postcode", postcode cannot be nil.')
      end

      if @country.nil?
        invalid_properties.push('invalid value for "country", country cannot be nil.')
      end

      pattern = Regexp.new(/^[^!$%^*=<>]*$/)
      if !@line1.nil? && @line1 !~ pattern
        invalid_properties.push("invalid value for \"line1\", must conform to the pattern #{pattern}.")
      end

      pattern = Regexp.new(/^[^!$%^*=<>]*$/)
      if !@line2.nil? && @line2 !~ pattern
        invalid_properties.push("invalid value for \"line2\", must conform to the pattern #{pattern}.")
      end

      pattern = Regexp.new(/^[^!$%^*=<>]*$/)
      if !@line3.nil? && @line3 !~ pattern
        invalid_properties.push("invalid value for \"line3\", must conform to the pattern #{pattern}.")
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @postcode.nil?
      return false if @country.nil?
      return false if !@line1.nil? && @line1 !~ Regexp.new(/^[^!$%^*=<>]*$/)
      return false if !@line2.nil? && @line2 !~ Regexp.new(/^[^!$%^*=<>]*$/)
      return false if !@line3.nil? && @line3 !~ Regexp.new(/^[^!$%^*=<>]*$/)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] line1 Value to be assigned
    def line1=(line1)
      pattern = Regexp.new(/^[^!$%^*=<>]*$/)
      if !line1.nil? && line1 !~ pattern
        fail ArgumentError, "invalid value for \"line1\", must conform to the pattern #{pattern}."
      end

      @line1 = line1
    end

    # Custom attribute writer method with validation
    # @param [Object] line2 Value to be assigned
    def line2=(line2)
      pattern = Regexp.new(/^[^!$%^*=<>]*$/)
      if !line2.nil? && line2 !~ pattern
        fail ArgumentError, "invalid value for \"line2\", must conform to the pattern #{pattern}."
      end

      @line2 = line2
    end

    # Custom attribute writer method with validation
    # @param [Object] line3 Value to be assigned
    def line3=(line3)
      pattern = Regexp.new(/^[^!$%^*=<>]*$/)
      if !line3.nil? && line3 !~ pattern
        fail ArgumentError, "invalid value for \"line3\", must conform to the pattern #{pattern}."
      end

      @line3 = line3
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          flat_number == o.flat_number &&
          building_number == o.building_number &&
          building_name == o.building_name &&
          street == o.street &&
          sub_street == o.sub_street &&
          town == o.town &&
          postcode == o.postcode &&
          country == o.country &&
          state == o.state &&
          line1 == o.line1 &&
          line2 == o.line2 &&
          line3 == o.line3
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [flat_number, building_number, building_name, street, sub_street, town, postcode, country, state, line1, line2, line3].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      transformed_hash = {}
      openapi_types.each_pair do |key, type|
        if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = nil
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[attribute_map[key]].is_a?(Array)
            transformed_hash["#{key}"] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
          end
        elsif !attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = _deserialize(type, attributes[attribute_map[key]])
        end
      end
      new(transformed_hash)
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def self._deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = Onfido.const_get(type)
        klass.respond_to?(:openapi_any_of) || klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
