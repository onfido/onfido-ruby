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
  # The resource affected by this event.
  class WebhookEventPayloadResource
    # The identifier of the resource.
    attr_accessor :id

    # The unique identifier for the Applicant.
    attr_accessor :applicant_id

    # The date and time when the resource was created.
    attr_accessor :created_at

    # The date and time when the resource was last updated.
    attr_accessor :updated_at

    # The URL for viewing the resource on Onfido Dashboard.
    attr_accessor :dashboard_url

    # The unique identifier for the Workflow.
    attr_accessor :workflow_id

    attr_accessor :workflow_run_id

    # The identifier for the Workflow version.
    attr_accessor :workflow_version_id

    # The identifier for the Task Definition.
    attr_accessor :task_def_id

    # The task definition version.
    attr_accessor :task_def_version

    # Input object with the fields used by the Task execution.
    attr_accessor :input

    # Output object with the fields produced by the Task execution.
    attr_accessor :output

    # The reasons the Workflow Run outcome was reached. Configurable when creating the Workflow Version.
    attr_accessor :reasons

    # Object for the configuration of the Workflow Run link.
    attr_accessor :link

    # Error object that details why a Workflow Run is in Error status.
    attr_accessor :error

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'applicant_id' => :'applicant_id',
        :'created_at' => :'created_at',
        :'updated_at' => :'updated_at',
        :'dashboard_url' => :'dashboard_url',
        :'workflow_id' => :'workflow_id',
        :'workflow_run_id' => :'workflow_run_id',
        :'workflow_version_id' => :'workflow_version_id',
        :'task_def_id' => :'task_def_id',
        :'task_def_version' => :'task_def_version',
        :'input' => :'input',
        :'output' => :'output',
        :'reasons' => :'reasons',
        :'link' => :'link',
        :'error' => :'error'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'String',
        :'applicant_id' => :'String',
        :'created_at' => :'Time',
        :'updated_at' => :'Time',
        :'dashboard_url' => :'String',
        :'workflow_id' => :'String',
        :'workflow_run_id' => :'String',
        :'workflow_version_id' => :'Integer',
        :'task_def_id' => :'String',
        :'task_def_version' => :'String',
        :'input' => :'Object',
        :'output' => :'Object',
        :'reasons' => :'Array<String>',
        :'link' => :'WorkflowRunLink',
        :'error' => :'WorkflowRunError'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'task_def_version',
        :'output',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Onfido::WebhookEventPayloadResource` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Onfido::WebhookEventPayloadResource`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'applicant_id')
        self.applicant_id = attributes[:'applicant_id']
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.key?(:'updated_at')
        self.updated_at = attributes[:'updated_at']
      end

      if attributes.key?(:'dashboard_url')
        self.dashboard_url = attributes[:'dashboard_url']
      end

      if attributes.key?(:'workflow_id')
        self.workflow_id = attributes[:'workflow_id']
      end

      if attributes.key?(:'workflow_run_id')
        self.workflow_run_id = attributes[:'workflow_run_id']
      end

      if attributes.key?(:'workflow_version_id')
        self.workflow_version_id = attributes[:'workflow_version_id']
      end

      if attributes.key?(:'task_def_id')
        self.task_def_id = attributes[:'task_def_id']
      end

      if attributes.key?(:'task_def_version')
        self.task_def_version = attributes[:'task_def_version']
      end

      if attributes.key?(:'input')
        self.input = attributes[:'input']
      end

      if attributes.key?(:'output')
        self.output = attributes[:'output']
      end

      if attributes.key?(:'reasons')
        if (value = attributes[:'reasons']).is_a?(Array)
          self.reasons = value
        end
      end

      if attributes.key?(:'link')
        self.link = attributes[:'link']
      end

      if attributes.key?(:'error')
        self.error = attributes[:'error']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      pattern = Regexp.new(/^[0-9a-z_-]+$/)
      if !@task_def_id.nil? && @task_def_id !~ pattern
        invalid_properties.push("invalid value for \"task_def_id\", must conform to the pattern #{pattern}.")
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if !@task_def_id.nil? && @task_def_id !~ Regexp.new(/^[0-9a-z_-]+$/)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] task_def_id Value to be assigned
    def task_def_id=(task_def_id)
      if task_def_id.nil?
        fail ArgumentError, 'task_def_id cannot be nil'
      end

      pattern = Regexp.new(/^[0-9a-z_-]+$/)
      if task_def_id !~ pattern
        fail ArgumentError, "invalid value for \"task_def_id\", must conform to the pattern #{pattern}."
      end

      @task_def_id = task_def_id
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          applicant_id == o.applicant_id &&
          created_at == o.created_at &&
          updated_at == o.updated_at &&
          dashboard_url == o.dashboard_url &&
          workflow_id == o.workflow_id &&
          workflow_run_id == o.workflow_run_id &&
          workflow_version_id == o.workflow_version_id &&
          task_def_id == o.task_def_id &&
          task_def_version == o.task_def_version &&
          input == o.input &&
          output == o.output &&
          reasons == o.reasons &&
          link == o.link &&
          error == o.error
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, applicant_id, created_at, updated_at, dashboard_url, workflow_id, workflow_run_id, workflow_version_id, task_def_id, task_def_version, input, output, reasons, link, error].hash
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