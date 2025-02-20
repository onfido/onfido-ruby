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
  class Check
    # An array of webhook ids describing which webhooks to trigger for this check.
    attr_accessor :webhook_ids

    # The ID of the applicant to do the check on.
    attr_accessor :applicant_id

    # Send an applicant form to applicant to complete to proceed with check. Defaults to false. 
    attr_accessor :applicant_provides_data

    # Array of tags being assigned to this check.
    attr_accessor :tags

    # For checks where `applicant_provides_data` is `true`, redirect to this URI when the applicant has submitted their data.
    attr_accessor :redirect_uri

    attr_accessor :privacy_notices_read_consent_given

    # The unique identifier for the check.
    attr_accessor :id

    # The date and time when this check was created.
    attr_accessor :created_at

    # The uri of this resource.
    attr_accessor :href

    attr_accessor :status

    # The overall result of the check, based on the results of the constituent reports.
    attr_accessor :result

    # A link to the applicant form, if `applicant_provides_data` is `true`.
    attr_accessor :form_uri

    # A link to the corresponding results page on the Onfido dashboard.
    attr_accessor :results_uri

    # An array of report ids.
    attr_accessor :report_ids

    # Indicates whether the object was created in the sandbox or not.
    attr_accessor :sandbox

    attr_accessor :paused

    attr_accessor :version

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
        :'webhook_ids' => :'webhook_ids',
        :'applicant_id' => :'applicant_id',
        :'applicant_provides_data' => :'applicant_provides_data',
        :'tags' => :'tags',
        :'redirect_uri' => :'redirect_uri',
        :'privacy_notices_read_consent_given' => :'privacy_notices_read_consent_given',
        :'id' => :'id',
        :'created_at' => :'created_at',
        :'href' => :'href',
        :'status' => :'status',
        :'result' => :'result',
        :'form_uri' => :'form_uri',
        :'results_uri' => :'results_uri',
        :'report_ids' => :'report_ids',
        :'sandbox' => :'sandbox',
        :'paused' => :'paused',
        :'version' => :'version'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'webhook_ids' => :'Array<String>',
        :'applicant_id' => :'String',
        :'applicant_provides_data' => :'Boolean',
        :'tags' => :'Array<String>',
        :'redirect_uri' => :'String',
        :'privacy_notices_read_consent_given' => :'Boolean',
        :'id' => :'String',
        :'created_at' => :'Time',
        :'href' => :'String',
        :'status' => :'CheckStatus',
        :'result' => :'String',
        :'form_uri' => :'String',
        :'results_uri' => :'String',
        :'report_ids' => :'Array<String>',
        :'sandbox' => :'Boolean',
        :'paused' => :'Boolean',
        :'version' => :'String'
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
      :'CheckResponse',
      :'CheckShared'
      ]
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Onfido::Check` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Onfido::Check`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'webhook_ids')
        if (value = attributes[:'webhook_ids']).is_a?(Array)
          self.webhook_ids = value
        end
      end

      if attributes.key?(:'applicant_id')
        self.applicant_id = attributes[:'applicant_id']
      else
        self.applicant_id = nil
      end

      if attributes.key?(:'applicant_provides_data')
        self.applicant_provides_data = attributes[:'applicant_provides_data']
      end

      if attributes.key?(:'tags')
        if (value = attributes[:'tags']).is_a?(Array)
          self.tags = value
        end
      end

      if attributes.key?(:'redirect_uri')
        self.redirect_uri = attributes[:'redirect_uri']
      end

      if attributes.key?(:'privacy_notices_read_consent_given')
        self.privacy_notices_read_consent_given = attributes[:'privacy_notices_read_consent_given']
      end

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      else
        self.id = nil
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.key?(:'href')
        self.href = attributes[:'href']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'result')
        self.result = attributes[:'result']
      end

      if attributes.key?(:'form_uri')
        self.form_uri = attributes[:'form_uri']
      end

      if attributes.key?(:'results_uri')
        self.results_uri = attributes[:'results_uri']
      end

      if attributes.key?(:'report_ids')
        if (value = attributes[:'report_ids']).is_a?(Array)
          self.report_ids = value
        end
      end

      if attributes.key?(:'sandbox')
        self.sandbox = attributes[:'sandbox']
      end

      if attributes.key?(:'paused')
        self.paused = attributes[:'paused']
      end

      if attributes.key?(:'version')
        self.version = attributes[:'version']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @applicant_id.nil?
        invalid_properties.push('invalid value for "applicant_id", applicant_id cannot be nil.')
      end

      if @id.nil?
        invalid_properties.push('invalid value for "id", id cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @applicant_id.nil?
      return false if @id.nil?
      result_validator = EnumAttributeValidator.new('String', ["clear", "consider", "unknown_default_open_api"])
      return false unless result_validator.valid?(@result)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] result Object to be assigned
    def result=(result)
      validator = EnumAttributeValidator.new('String', ["clear", "consider", "unknown_default_open_api"])
      unless validator.valid?(result)
        fail ArgumentError, "invalid value for \"result\", must be one of #{validator.allowable_values}."
      end
      @result = result
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          webhook_ids == o.webhook_ids &&
          applicant_id == o.applicant_id &&
          applicant_provides_data == o.applicant_provides_data &&
          tags == o.tags &&
          redirect_uri == o.redirect_uri &&
          privacy_notices_read_consent_given == o.privacy_notices_read_consent_given &&
          id == o.id &&
          created_at == o.created_at &&
          href == o.href &&
          status == o.status &&
          result == o.result &&
          form_uri == o.form_uri &&
          results_uri == o.results_uri &&
          report_ids == o.report_ids &&
          sandbox == o.sandbox &&
          paused == o.paused &&
          version == o.version
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [webhook_ids, applicant_id, applicant_provides_data, tags, redirect_uri, privacy_notices_read_consent_given, id, created_at, href, status, result, form_uri, results_uri, report_ids, sandbox, paused, version].hash
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
