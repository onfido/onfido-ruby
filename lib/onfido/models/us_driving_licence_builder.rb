=begin
#Onfido API v3.6

#The Onfido API (v3.6)

The version of the OpenAPI document: v3.6

Generated by: https://openapi-generator.tech
Generator version: 7.11.0

=end

require 'date'
require 'time'

module Onfido
  class UsDrivingLicenceBuilder
    # Driving licence ID number
    attr_accessor :id_number

    # Two letter code of issuing state (state-issued driving licenses only)
    attr_accessor :issue_state

    # Line 1 of the address
    attr_accessor :address_line_1

    # Line 2 of the address
    attr_accessor :address_line_2

    # The city of the owner's address
    attr_accessor :city

    # Date of birth in yyyy-mm-dd format
    attr_accessor :date_of_birth

    # Document category.
    attr_accessor :document_category

    # Expiration date of the driving licence in yyyy-mm-dd format
    attr_accessor :expiration_date

    # Eye color code.
    attr_accessor :eye_color_code

    # The owner's first name
    attr_accessor :first_name

    attr_accessor :gender

    # Issue date in yyyy-mm-dd format
    attr_accessor :issue_date

    # The owner's surname
    attr_accessor :last_name

    # The owner's middle name
    attr_accessor :middle_name

    # The owner's name suffix
    attr_accessor :name_suffix

    # The postcode or ZIP of the owner's address
    attr_accessor :postal_code

    # 2-characters state code
    attr_accessor :state

    # Weight in pounds
    attr_accessor :weight_measure

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
        :'id_number' => :'id_number',
        :'issue_state' => :'issue_state',
        :'address_line_1' => :'address_line_1',
        :'address_line_2' => :'address_line_2',
        :'city' => :'city',
        :'date_of_birth' => :'date_of_birth',
        :'document_category' => :'document_category',
        :'expiration_date' => :'expiration_date',
        :'eye_color_code' => :'eye_color_code',
        :'first_name' => :'first_name',
        :'gender' => :'gender',
        :'issue_date' => :'issue_date',
        :'last_name' => :'last_name',
        :'middle_name' => :'middle_name',
        :'name_suffix' => :'name_suffix',
        :'postal_code' => :'postal_code',
        :'state' => :'state',
        :'weight_measure' => :'weight_measure'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id_number' => :'String',
        :'issue_state' => :'String',
        :'address_line_1' => :'String',
        :'address_line_2' => :'String',
        :'city' => :'String',
        :'date_of_birth' => :'Date',
        :'document_category' => :'String',
        :'expiration_date' => :'Date',
        :'eye_color_code' => :'String',
        :'first_name' => :'String',
        :'gender' => :'String',
        :'issue_date' => :'Date',
        :'last_name' => :'String',
        :'middle_name' => :'String',
        :'name_suffix' => :'String',
        :'postal_code' => :'String',
        :'state' => :'String',
        :'weight_measure' => :'Integer'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # List of class defined in allOf (OpenAPI v3)
    def self.openapi_all_of
      [
      :'UsDrivingLicenceShared'
      ]
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Onfido::UsDrivingLicenceBuilder` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Onfido::UsDrivingLicenceBuilder`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id_number')
        self.id_number = attributes[:'id_number']
      else
        self.id_number = nil
      end

      if attributes.key?(:'issue_state')
        self.issue_state = attributes[:'issue_state']
      else
        self.issue_state = nil
      end

      if attributes.key?(:'address_line_1')
        self.address_line_1 = attributes[:'address_line_1']
      end

      if attributes.key?(:'address_line_2')
        self.address_line_2 = attributes[:'address_line_2']
      end

      if attributes.key?(:'city')
        self.city = attributes[:'city']
      end

      if attributes.key?(:'date_of_birth')
        self.date_of_birth = attributes[:'date_of_birth']
      end

      if attributes.key?(:'document_category')
        self.document_category = attributes[:'document_category']
      end

      if attributes.key?(:'expiration_date')
        self.expiration_date = attributes[:'expiration_date']
      end

      if attributes.key?(:'eye_color_code')
        self.eye_color_code = attributes[:'eye_color_code']
      end

      if attributes.key?(:'first_name')
        self.first_name = attributes[:'first_name']
      end

      if attributes.key?(:'gender')
        self.gender = attributes[:'gender']
      end

      if attributes.key?(:'issue_date')
        self.issue_date = attributes[:'issue_date']
      end

      if attributes.key?(:'last_name')
        self.last_name = attributes[:'last_name']
      end

      if attributes.key?(:'middle_name')
        self.middle_name = attributes[:'middle_name']
      end

      if attributes.key?(:'name_suffix')
        self.name_suffix = attributes[:'name_suffix']
      end

      if attributes.key?(:'postal_code')
        self.postal_code = attributes[:'postal_code']
      end

      if attributes.key?(:'state')
        self.state = attributes[:'state']
      end

      if attributes.key?(:'weight_measure')
        self.weight_measure = attributes[:'weight_measure']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @id_number.nil?
        invalid_properties.push('invalid value for "id_number", id_number cannot be nil.')
      end

      if @issue_state.nil?
        invalid_properties.push('invalid value for "issue_state", issue_state cannot be nil.')
      end

      pattern = Regexp.new(/^[A-Z]{2}$/)
      if @issue_state !~ pattern
        invalid_properties.push("invalid value for \"issue_state\", must conform to the pattern #{pattern}.")
      end

      pattern = Regexp.new(/^[A-Z]{2}$/)
      if !@state.nil? && @state !~ pattern
        invalid_properties.push("invalid value for \"state\", must conform to the pattern #{pattern}.")
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @id_number.nil?
      return false if @issue_state.nil?
      return false if @issue_state !~ Regexp.new(/^[A-Z]{2}$/)
      document_category_validator = EnumAttributeValidator.new('String', ["driver license", "driver permit", "id card", "unknown_default_open_api"])
      return false unless document_category_validator.valid?(@document_category)
      eye_color_code_validator = EnumAttributeValidator.new('String', ["BLK", "BLU", "BRO", "DIC", "GRY", "GRN", "HAZ", "MAR", "PNK", "unknown_default_open_api"])
      return false unless eye_color_code_validator.valid?(@eye_color_code)
      gender_validator = EnumAttributeValidator.new('String', ["Male", "Female", "unknown_default_open_api"])
      return false unless gender_validator.valid?(@gender)
      return false if !@state.nil? && @state !~ Regexp.new(/^[A-Z]{2}$/)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] issue_state Value to be assigned
    def issue_state=(issue_state)
      if issue_state.nil?
        fail ArgumentError, 'issue_state cannot be nil'
      end

      pattern = Regexp.new(/^[A-Z]{2}$/)
      if issue_state !~ pattern
        fail ArgumentError, "invalid value for \"issue_state\", must conform to the pattern #{pattern}."
      end

      @issue_state = issue_state
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] document_category Object to be assigned
    def document_category=(document_category)
      validator = EnumAttributeValidator.new('String', ["driver license", "driver permit", "id card", "unknown_default_open_api"])
      unless validator.valid?(document_category)
        fail ArgumentError, "invalid value for \"document_category\", must be one of #{validator.allowable_values}."
      end
      @document_category = document_category
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] eye_color_code Object to be assigned
    def eye_color_code=(eye_color_code)
      validator = EnumAttributeValidator.new('String', ["BLK", "BLU", "BRO", "DIC", "GRY", "GRN", "HAZ", "MAR", "PNK", "unknown_default_open_api"])
      unless validator.valid?(eye_color_code)
        fail ArgumentError, "invalid value for \"eye_color_code\", must be one of #{validator.allowable_values}."
      end
      @eye_color_code = eye_color_code
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
    # @param [Object] state Value to be assigned
    def state=(state)
      if state.nil?
        fail ArgumentError, 'state cannot be nil'
      end

      pattern = Regexp.new(/^[A-Z]{2}$/)
      if state !~ pattern
        fail ArgumentError, "invalid value for \"state\", must conform to the pattern #{pattern}."
      end

      @state = state
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id_number == o.id_number &&
          issue_state == o.issue_state &&
          address_line_1 == o.address_line_1 &&
          address_line_2 == o.address_line_2 &&
          city == o.city &&
          date_of_birth == o.date_of_birth &&
          document_category == o.document_category &&
          expiration_date == o.expiration_date &&
          eye_color_code == o.eye_color_code &&
          first_name == o.first_name &&
          gender == o.gender &&
          issue_date == o.issue_date &&
          last_name == o.last_name &&
          middle_name == o.middle_name &&
          name_suffix == o.name_suffix &&
          postal_code == o.postal_code &&
          state == o.state &&
          weight_measure == o.weight_measure
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id_number, issue_state, address_line_1, address_line_2, city, date_of_birth, document_category, expiration_date, eye_color_code, first_name, gender, issue_date, last_name, middle_name, name_suffix, postal_code, state, weight_measure].hash
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
