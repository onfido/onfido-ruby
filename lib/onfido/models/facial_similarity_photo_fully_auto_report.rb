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
  class FacialSimilarityPhotoFullyAutoReport
    # The unique identifier for the report. Read-only.
    attr_accessor :id

    # The date and time at which the report was first initiated. Read-only.
    attr_accessor :created_at

    # The API endpoint to retrieve the report. Read-only.
    attr_accessor :href

    attr_accessor :status

    attr_accessor :result

    attr_accessor :sub_result

    # The ID of the check to which the report belongs. Read-only.
    attr_accessor :check_id

    attr_accessor :name

    # Array of objects with document ids that were used in the Onfido engine.
    attr_accessor :documents

    # Array of objects with live photo ids that were used in the Onfido engine.
    attr_accessor :live_photos

    # Array of objects with live video ids that were used in the Onfido engine.
    attr_accessor :live_videos

    # Array of objects with motion capture ids that were used in the Onfido engine.
    attr_accessor :motion_captures

    # Array of objects with id photo ids that were used in the Onfido engine.
    attr_accessor :id_photos

    attr_accessor :breakdown

    attr_accessor :properties

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
        :'id' => :'id',
        :'created_at' => :'created_at',
        :'href' => :'href',
        :'status' => :'status',
        :'result' => :'result',
        :'sub_result' => :'sub_result',
        :'check_id' => :'check_id',
        :'name' => :'name',
        :'documents' => :'documents',
        :'live_photos' => :'live_photos',
        :'live_videos' => :'live_videos',
        :'motion_captures' => :'motion_captures',
        :'id_photos' => :'id_photos',
        :'breakdown' => :'breakdown',
        :'properties' => :'properties'
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
        :'created_at' => :'Time',
        :'href' => :'String',
        :'status' => :'ReportStatus',
        :'result' => :'ReportResult',
        :'sub_result' => :'ReportSubResult',
        :'check_id' => :'String',
        :'name' => :'ReportName',
        :'documents' => :'Array<ReportDocument>',
        :'live_photos' => :'Array<FacialSimilarityReportMedia>',
        :'live_videos' => :'Array<FacialSimilarityReportMedia>',
        :'motion_captures' => :'Array<FacialSimilarityReportMedia>',
        :'id_photos' => :'Array<FacialSimilarityReportMedia>',
        :'breakdown' => :'FacialSimilarityPhotoFullyAutoBreakdown',
        :'properties' => :'FacialSimilarityPhotoFullyAutoProperties'
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
      :'FacialSimilarityReportShared',
      :'ReportShared'
      ]
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Onfido::FacialSimilarityPhotoFullyAutoReport` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Onfido::FacialSimilarityPhotoFullyAutoReport`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

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

      if attributes.key?(:'sub_result')
        self.sub_result = attributes[:'sub_result']
      end

      if attributes.key?(:'check_id')
        self.check_id = attributes[:'check_id']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      else
        self.name = nil
      end

      if attributes.key?(:'documents')
        if (value = attributes[:'documents']).is_a?(Array)
          self.documents = value
        end
      end

      if attributes.key?(:'live_photos')
        if (value = attributes[:'live_photos']).is_a?(Array)
          self.live_photos = value
        end
      end

      if attributes.key?(:'live_videos')
        if (value = attributes[:'live_videos']).is_a?(Array)
          self.live_videos = value
        end
      end

      if attributes.key?(:'motion_captures')
        if (value = attributes[:'motion_captures']).is_a?(Array)
          self.motion_captures = value
        end
      end

      if attributes.key?(:'id_photos')
        if (value = attributes[:'id_photos']).is_a?(Array)
          self.id_photos = value
        end
      end

      if attributes.key?(:'breakdown')
        self.breakdown = attributes[:'breakdown']
      end

      if attributes.key?(:'properties')
        self.properties = attributes[:'properties']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @id.nil?
        invalid_properties.push('invalid value for "id", id cannot be nil.')
      end

      if @name.nil?
        invalid_properties.push('invalid value for "name", name cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @id.nil?
      return false if @name.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          created_at == o.created_at &&
          href == o.href &&
          status == o.status &&
          result == o.result &&
          sub_result == o.sub_result &&
          check_id == o.check_id &&
          name == o.name &&
          documents == o.documents &&
          live_photos == o.live_photos &&
          live_videos == o.live_videos &&
          motion_captures == o.motion_captures &&
          id_photos == o.id_photos &&
          breakdown == o.breakdown &&
          properties == o.properties
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, created_at, href, status, result, sub_result, check_id, name, documents, live_photos, live_videos, motion_captures, id_photos, breakdown, properties].hash
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
