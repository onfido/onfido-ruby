=begin
#Onfido API v3.6

#The Onfido API (v3.6)

The version of the OpenAPI document: v3.6

Generated by: https://openapi-generator.tech
Generator version: 7.8.0

=end

require 'date'
require 'time'

module Onfido
  class ExtractionExtractedData
    # The official document number.
    attr_accessor :document_number

    # First name.
    attr_accessor :first_name

    # Last name.
    attr_accessor :last_name

    # Full name.
    attr_accessor :full_name

    # Spouse name (French documents only).
    attr_accessor :spouse_name

    # Widow name (French documents only).
    attr_accessor :widow_name

    # Alias name (French documents only).
    attr_accessor :alias_name

    # Gender (Valid values are Male and Female).
    attr_accessor :gender

    # Date of birth in YYYY-MM-DD format.
    attr_accessor :date_of_birth

    # Date of expiry in YYYY-MM-DD format.
    attr_accessor :date_of_expiry

    # Date of expiry in YYYY-MM-DD format.
    attr_accessor :expiry_date

    # Nationality in 3-letter ISO code.
    attr_accessor :nationality

    # Line 1 of the MRZ code.
    attr_accessor :mrz_line_1

    # Line 2 of the MRZ code.
    attr_accessor :mrz_line_2

    # Line 3 of the MRZ code.
    attr_accessor :mrz_line_3

    # Line 1 of the address.
    attr_accessor :address_1

    # Line 2 of the address.
    attr_accessor :address_2

    # Line 3 of the address.
    attr_accessor :address_3

    # Line 4 of the address.
    attr_accessor :address_4

    # Line 5 of the address.
    attr_accessor :address_5

    # Issuing authority.
    attr_accessor :issuing_authority

    # Document country in 3-letter ISO code.
    attr_accessor :issuing_country

    # Type of document.
    attr_accessor :document_type

    # Place of birth.
    attr_accessor :place_of_birth

    # The state that issued the document.
    attr_accessor :issuing_state

    # Issuing date in YYYY-MM-DD format.
    attr_accessor :issuing_date

    # The owner's unique identification number.
    attr_accessor :personal_number

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
        :'document_number' => :'document_number',
        :'first_name' => :'first_name',
        :'last_name' => :'last_name',
        :'full_name' => :'full_name',
        :'spouse_name' => :'spouse_name',
        :'widow_name' => :'widow_name',
        :'alias_name' => :'alias_name',
        :'gender' => :'gender',
        :'date_of_birth' => :'date_of_birth',
        :'date_of_expiry' => :'date_of_expiry',
        :'expiry_date' => :'expiry_date',
        :'nationality' => :'nationality',
        :'mrz_line_1' => :'mrz_line_1',
        :'mrz_line_2' => :'mrz_line_2',
        :'mrz_line_3' => :'mrz_line_3',
        :'address_1' => :'address_1',
        :'address_2' => :'address_2',
        :'address_3' => :'address_3',
        :'address_4' => :'address_4',
        :'address_5' => :'address_5',
        :'issuing_authority' => :'issuing_authority',
        :'issuing_country' => :'issuing_country',
        :'document_type' => :'document_type',
        :'place_of_birth' => :'place_of_birth',
        :'issuing_state' => :'issuing_state',
        :'issuing_date' => :'issuing_date',
        :'personal_number' => :'personal_number'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'document_number' => :'String',
        :'first_name' => :'String',
        :'last_name' => :'String',
        :'full_name' => :'String',
        :'spouse_name' => :'String',
        :'widow_name' => :'String',
        :'alias_name' => :'String',
        :'gender' => :'String',
        :'date_of_birth' => :'Date',
        :'date_of_expiry' => :'Date',
        :'expiry_date' => :'Date',
        :'nationality' => :'String',
        :'mrz_line_1' => :'String',
        :'mrz_line_2' => :'String',
        :'mrz_line_3' => :'String',
        :'address_1' => :'String',
        :'address_2' => :'String',
        :'address_3' => :'String',
        :'address_4' => :'String',
        :'address_5' => :'String',
        :'issuing_authority' => :'String',
        :'issuing_country' => :'CountryCodes',
        :'document_type' => :'DocumentTypes',
        :'place_of_birth' => :'String',
        :'issuing_state' => :'String',
        :'issuing_date' => :'Date',
        :'personal_number' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Onfido::ExtractionExtractedData` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Onfido::ExtractionExtractedData`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'document_number')
        self.document_number = attributes[:'document_number']
      end

      if attributes.key?(:'first_name')
        self.first_name = attributes[:'first_name']
      end

      if attributes.key?(:'last_name')
        self.last_name = attributes[:'last_name']
      end

      if attributes.key?(:'full_name')
        self.full_name = attributes[:'full_name']
      end

      if attributes.key?(:'spouse_name')
        self.spouse_name = attributes[:'spouse_name']
      end

      if attributes.key?(:'widow_name')
        self.widow_name = attributes[:'widow_name']
      end

      if attributes.key?(:'alias_name')
        self.alias_name = attributes[:'alias_name']
      end

      if attributes.key?(:'gender')
        self.gender = attributes[:'gender']
      end

      if attributes.key?(:'date_of_birth')
        self.date_of_birth = attributes[:'date_of_birth']
      end

      if attributes.key?(:'date_of_expiry')
        self.date_of_expiry = attributes[:'date_of_expiry']
      end

      if attributes.key?(:'expiry_date')
        self.expiry_date = attributes[:'expiry_date']
      end

      if attributes.key?(:'nationality')
        self.nationality = attributes[:'nationality']
      end

      if attributes.key?(:'mrz_line_1')
        self.mrz_line_1 = attributes[:'mrz_line_1']
      end

      if attributes.key?(:'mrz_line_2')
        self.mrz_line_2 = attributes[:'mrz_line_2']
      end

      if attributes.key?(:'mrz_line_3')
        self.mrz_line_3 = attributes[:'mrz_line_3']
      end

      if attributes.key?(:'address_1')
        self.address_1 = attributes[:'address_1']
      end

      if attributes.key?(:'address_2')
        self.address_2 = attributes[:'address_2']
      end

      if attributes.key?(:'address_3')
        self.address_3 = attributes[:'address_3']
      end

      if attributes.key?(:'address_4')
        self.address_4 = attributes[:'address_4']
      end

      if attributes.key?(:'address_5')
        self.address_5 = attributes[:'address_5']
      end

      if attributes.key?(:'issuing_authority')
        self.issuing_authority = attributes[:'issuing_authority']
      end

      if attributes.key?(:'issuing_country')
        self.issuing_country = attributes[:'issuing_country']
      end

      if attributes.key?(:'document_type')
        self.document_type = attributes[:'document_type']
      end

      if attributes.key?(:'place_of_birth')
        self.place_of_birth = attributes[:'place_of_birth']
      end

      if attributes.key?(:'issuing_state')
        self.issuing_state = attributes[:'issuing_state']
      end

      if attributes.key?(:'issuing_date')
        self.issuing_date = attributes[:'issuing_date']
      end

      if attributes.key?(:'personal_number')
        self.personal_number = attributes[:'personal_number']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      pattern = Regexp.new(/^[A-Z]{3}$/)
      if !@nationality.nil? && @nationality !~ pattern
        invalid_properties.push("invalid value for \"nationality\", must conform to the pattern #{pattern}.")
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      gender_validator = EnumAttributeValidator.new('String', ["Male", "Female", "unknown_default_open_api"])
      return false unless gender_validator.valid?(@gender)
      return false if !@nationality.nil? && @nationality !~ Regexp.new(/^[A-Z]{3}$/)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] gender Object to be assigned
    def gender=(gender)
      validator = EnumAttributeValidator.new('String', ["Male", "Female", "unknown_default_open_api"])
      unless validator.valid?(gender)
        fail ArgumentError, "invalid value for \"gender\", must be one of #{validator.allowable_values}."
      end
      @gender = gender
    end

    # Custom attribute writer method with validation
    # @param [Object] nationality Value to be assigned
    def nationality=(nationality)
      if nationality.nil?
        fail ArgumentError, 'nationality cannot be nil'
      end

      pattern = Regexp.new(/^[A-Z]{3}$/)
      if nationality !~ pattern
        fail ArgumentError, "invalid value for \"nationality\", must conform to the pattern #{pattern}."
      end

      @nationality = nationality
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          document_number == o.document_number &&
          first_name == o.first_name &&
          last_name == o.last_name &&
          full_name == o.full_name &&
          spouse_name == o.spouse_name &&
          widow_name == o.widow_name &&
          alias_name == o.alias_name &&
          gender == o.gender &&
          date_of_birth == o.date_of_birth &&
          date_of_expiry == o.date_of_expiry &&
          expiry_date == o.expiry_date &&
          nationality == o.nationality &&
          mrz_line_1 == o.mrz_line_1 &&
          mrz_line_2 == o.mrz_line_2 &&
          mrz_line_3 == o.mrz_line_3 &&
          address_1 == o.address_1 &&
          address_2 == o.address_2 &&
          address_3 == o.address_3 &&
          address_4 == o.address_4 &&
          address_5 == o.address_5 &&
          issuing_authority == o.issuing_authority &&
          issuing_country == o.issuing_country &&
          document_type == o.document_type &&
          place_of_birth == o.place_of_birth &&
          issuing_state == o.issuing_state &&
          issuing_date == o.issuing_date &&
          personal_number == o.personal_number
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [document_number, first_name, last_name, full_name, spouse_name, widow_name, alias_name, gender, date_of_birth, date_of_expiry, expiry_date, nationality, mrz_line_1, mrz_line_2, mrz_line_3, address_1, address_2, address_3, address_4, address_5, issuing_authority, issuing_country, document_type, place_of_birth, issuing_state, issuing_date, personal_number].hash
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
