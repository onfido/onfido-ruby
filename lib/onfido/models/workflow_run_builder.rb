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
  class WorkflowRunBuilder
    # The unique identifier for the Applicant.
    attr_accessor :applicant_id

    # The unique identifier for the Workflow.
    attr_accessor :workflow_id

    # Tags or labels assigned to the workflow run.
    attr_accessor :tags

    # Customer-provided user identifier.
    attr_accessor :customer_user_id

    # Object for the configuration of the Workflow Run link.
    attr_accessor :link

    # The date and time when the Workflow Run was created.
    attr_accessor :created_at

    # The date and time when the Workflow Run was last updated.
    attr_accessor :updated_at

    # Object with Custom Input Data to be used in the Workflow Run.
    attr_accessor :custom_data

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'applicant_id' => :'applicant_id',
        :'workflow_id' => :'workflow_id',
        :'tags' => :'tags',
        :'customer_user_id' => :'customer_user_id',
        :'link' => :'link',
        :'created_at' => :'created_at',
        :'updated_at' => :'updated_at',
        :'custom_data' => :'custom_data'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'applicant_id' => :'String',
        :'workflow_id' => :'String',
        :'tags' => :'Array<String>',
        :'customer_user_id' => :'String',
        :'link' => :'WorkflowRunLink',
        :'created_at' => :'Time',
        :'updated_at' => :'Time',
        :'custom_data' => :'Hash<String, Object>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'tags',
      ])
    end

    # List of class defined in allOf (OpenAPI v3)
    def self.openapi_all_of
      [
      :'WorkflowRunRequest',
      :'WorkflowRunShared'
      ]
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Onfido::WorkflowRunBuilder` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Onfido::WorkflowRunBuilder`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'applicant_id')
        self.applicant_id = attributes[:'applicant_id']
      else
        self.applicant_id = nil
      end

      if attributes.key?(:'workflow_id')
        self.workflow_id = attributes[:'workflow_id']
      else
        self.workflow_id = nil
      end

      if attributes.key?(:'tags')
        if (value = attributes[:'tags']).is_a?(Array)
          self.tags = value
        end
      end

      if attributes.key?(:'customer_user_id')
        self.customer_user_id = attributes[:'customer_user_id']
      end

      if attributes.key?(:'link')
        self.link = attributes[:'link']
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.key?(:'updated_at')
        self.updated_at = attributes[:'updated_at']
      end

      if attributes.key?(:'custom_data')
        if (value = attributes[:'custom_data']).is_a?(Hash)
          self.custom_data = value
        end
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

      if @workflow_id.nil?
        invalid_properties.push('invalid value for "workflow_id", workflow_id cannot be nil.')
      end

      if !@tags.nil? && @tags.length > 30
        invalid_properties.push('invalid value for "tags", number of items must be less than or equal to 30.')
      end

      if !@customer_user_id.nil? && @customer_user_id.to_s.length > 256
        invalid_properties.push('invalid value for "customer_user_id", the character length must be smaller than or equal to 256.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @applicant_id.nil?
      return false if @workflow_id.nil?
      return false if !@tags.nil? && @tags.length > 30
      return false if !@customer_user_id.nil? && @customer_user_id.to_s.length > 256
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] tags Value to be assigned
    def tags=(tags)
      if !tags.nil? && tags.length > 30
        fail ArgumentError, 'invalid value for "tags", number of items must be less than or equal to 30.'
      end

      @tags = tags
    end

    # Custom attribute writer method with validation
    # @param [Object] customer_user_id Value to be assigned
    def customer_user_id=(customer_user_id)
      if customer_user_id.nil?
        fail ArgumentError, 'customer_user_id cannot be nil'
      end

      if customer_user_id.to_s.length > 256
        fail ArgumentError, 'invalid value for "customer_user_id", the character length must be smaller than or equal to 256.'
      end

      @customer_user_id = customer_user_id
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          applicant_id == o.applicant_id &&
          workflow_id == o.workflow_id &&
          tags == o.tags &&
          customer_user_id == o.customer_user_id &&
          link == o.link &&
          created_at == o.created_at &&
          updated_at == o.updated_at &&
          custom_data == o.custom_data
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [applicant_id, workflow_id, tags, customer_user_id, link, created_at, updated_at, custom_data].hash
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
