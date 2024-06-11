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
  class RepeatAttemptsList
    # The unique identifier of the completed Document report.
    attr_accessor :report_id

    # An array of repeat attempt objects. If no repeat attempts were found, the array will be empty. The number of objects returned can increase over time if more matches are received. 
    attr_accessor :repeat_attempts

    # The total number of attempts using the same document, including the current report under assessment.
    attr_accessor :attempts_count

    # A number between 0 and 1 which indicates the proportion of attempts that have been cleared, including the current report under assessment.
    attr_accessor :attempts_clear_rate

    # The number of unique entries in the repeat_attempts field for which at least one of the fields is a mismatch.
    attr_accessor :unique_mismatches_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'report_id' => :'report_id',
        :'repeat_attempts' => :'repeat_attempts',
        :'attempts_count' => :'attempts_count',
        :'attempts_clear_rate' => :'attempts_clear_rate',
        :'unique_mismatches_count' => :'unique_mismatches_count'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'report_id' => :'String',
        :'repeat_attempts' => :'Array<RepeatAttemptsListRepeatAttemptsInner>',
        :'attempts_count' => :'Integer',
        :'attempts_clear_rate' => :'Float',
        :'unique_mismatches_count' => :'Integer'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Onfido::RepeatAttemptsList` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Onfido::RepeatAttemptsList`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'report_id')
        self.report_id = attributes[:'report_id']
      end

      if attributes.key?(:'repeat_attempts')
        if (value = attributes[:'repeat_attempts']).is_a?(Array)
          self.repeat_attempts = value
        end
      else
        self.repeat_attempts = nil
      end

      if attributes.key?(:'attempts_count')
        self.attempts_count = attributes[:'attempts_count']
      end

      if attributes.key?(:'attempts_clear_rate')
        self.attempts_clear_rate = attributes[:'attempts_clear_rate']
      end

      if attributes.key?(:'unique_mismatches_count')
        self.unique_mismatches_count = attributes[:'unique_mismatches_count']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @repeat_attempts.nil?
        invalid_properties.push('invalid value for "repeat_attempts", repeat_attempts cannot be nil.')
      end

      if !@attempts_clear_rate.nil? && @attempts_clear_rate > 1
        invalid_properties.push('invalid value for "attempts_clear_rate", must be smaller than or equal to 1.')
      end

      if !@attempts_clear_rate.nil? && @attempts_clear_rate < 0
        invalid_properties.push('invalid value for "attempts_clear_rate", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @repeat_attempts.nil?
      return false if !@attempts_clear_rate.nil? && @attempts_clear_rate > 1
      return false if !@attempts_clear_rate.nil? && @attempts_clear_rate < 0
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] attempts_clear_rate Value to be assigned
    def attempts_clear_rate=(attempts_clear_rate)
      if attempts_clear_rate.nil?
        fail ArgumentError, 'attempts_clear_rate cannot be nil'
      end

      if attempts_clear_rate > 1
        fail ArgumentError, 'invalid value for "attempts_clear_rate", must be smaller than or equal to 1.'
      end

      if attempts_clear_rate < 0
        fail ArgumentError, 'invalid value for "attempts_clear_rate", must be greater than or equal to 0.'
      end

      @attempts_clear_rate = attempts_clear_rate
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          report_id == o.report_id &&
          repeat_attempts == o.repeat_attempts &&
          attempts_count == o.attempts_count &&
          attempts_clear_rate == o.attempts_clear_rate &&
          unique_mismatches_count == o.unique_mismatches_count
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [report_id, repeat_attempts, attempts_count, attempts_clear_rate, unique_mismatches_count].hash
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
