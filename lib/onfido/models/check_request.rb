=begin
#Onfido API v3.6

#The Onfido API (v3.6)

The version of the OpenAPI document: v3.6

Generated by: https://openapi-generator.tech
Generator version: 7.9.0

=end

require 'date'
require 'time'

module Onfido
  class CheckRequest
    # An array of report names (strings).
    attr_accessor :report_names

    # Optional. An array of document ids, for use with Document reports only. If omitted, the Document report will use the most recently uploaded document by default.
    attr_accessor :document_ids

    # Send an applicant form to applicant to complete to proceed with check. Defaults to false.
    attr_accessor :applicant_provides_data

    # Defaults to `true`. If set to `false`, you will only receive a response when all reports in your check have completed. 
    attr_accessor :asynchronous

    # For checks where `applicant_provides_data` is `true`, applicant form will not be automatically sent if `suppress_form_emails` is set to `true`. You can manually send the form at any time after the check has been created, using the link found in the form_uri attribute of the check object. Write-only. Defaults to false. 
    attr_accessor :suppress_form_emails

    # Triggers responses for particular sub-results for sandbox Document reports.
    attr_accessor :sub_result

    # Array of names of particular reports to return consider as their results. This is a feature available in sandbox testing
    attr_accessor :consider

    attr_accessor :us_driving_licence

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'report_names' => :'report_names',
        :'document_ids' => :'document_ids',
        :'applicant_provides_data' => :'applicant_provides_data',
        :'asynchronous' => :'asynchronous',
        :'suppress_form_emails' => :'suppress_form_emails',
        :'sub_result' => :'sub_result',
        :'consider' => :'consider',
        :'us_driving_licence' => :'us_driving_licence'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'report_names' => :'Array<ReportName>',
        :'document_ids' => :'Array<String>',
        :'applicant_provides_data' => :'Boolean',
        :'asynchronous' => :'Boolean',
        :'suppress_form_emails' => :'Boolean',
        :'sub_result' => :'String',
        :'consider' => :'Array<ReportName>',
        :'us_driving_licence' => :'UsDrivingLicenceBuilder'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Onfido::CheckRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Onfido::CheckRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'report_names')
        if (value = attributes[:'report_names']).is_a?(Array)
          self.report_names = value
        end
      else
        self.report_names = nil
      end

      if attributes.key?(:'document_ids')
        if (value = attributes[:'document_ids']).is_a?(Array)
          self.document_ids = value
        end
      end

      if attributes.key?(:'applicant_provides_data')
        self.applicant_provides_data = attributes[:'applicant_provides_data']
      else
        self.applicant_provides_data = false
      end

      if attributes.key?(:'asynchronous')
        self.asynchronous = attributes[:'asynchronous']
      else
        self.asynchronous = true
      end

      if attributes.key?(:'suppress_form_emails')
        self.suppress_form_emails = attributes[:'suppress_form_emails']
      end

      if attributes.key?(:'sub_result')
        self.sub_result = attributes[:'sub_result']
      end

      if attributes.key?(:'consider')
        if (value = attributes[:'consider']).is_a?(Array)
          self.consider = value
        end
      end

      if attributes.key?(:'us_driving_licence')
        self.us_driving_licence = attributes[:'us_driving_licence']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @report_names.nil?
        invalid_properties.push('invalid value for "report_names", report_names cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @report_names.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          report_names == o.report_names &&
          document_ids == o.document_ids &&
          applicant_provides_data == o.applicant_provides_data &&
          asynchronous == o.asynchronous &&
          suppress_form_emails == o.suppress_form_emails &&
          sub_result == o.sub_result &&
          consider == o.consider &&
          us_driving_licence == o.us_driving_licence
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [report_names, document_ids, applicant_provides_data, asynchronous, suppress_form_emails, sub_result, consider, us_driving_licence].hash
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
