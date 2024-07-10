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
  class DocumentWithDriverVerificationReportAllOfProperties
    attr_accessor :date_of_birth

    attr_accessor :date_of_expiry

    attr_accessor :personal_number

    attr_accessor :document_numbers

    attr_accessor :document_type

    attr_accessor :first_name

    attr_accessor :middle_name

    attr_accessor :last_name

    attr_accessor :gender

    attr_accessor :issuing_country

    attr_accessor :nationality

    attr_accessor :issuing_state

    attr_accessor :issuing_date

    attr_accessor :categorisation

    attr_accessor :mrz_line1

    attr_accessor :mrz_line2

    attr_accessor :mrz_line3

    attr_accessor :address

    attr_accessor :place_of_birth

    attr_accessor :spouse_name

    attr_accessor :widow_name

    attr_accessor :alias_name

    attr_accessor :issuing_authority

    attr_accessor :remarks

    attr_accessor :civil_state

    attr_accessor :expatriation

    attr_accessor :father_name

    attr_accessor :mother_name

    attr_accessor :religion

    attr_accessor :type_of_permit

    attr_accessor :version_number

    attr_accessor :document_subtype

    attr_accessor :profession

    attr_accessor :security_document_number

    attr_accessor :tax_number

    attr_accessor :nist_identity_evidence_strength

    attr_accessor :has_issuance_confirmation

    attr_accessor :real_id_compliance

    attr_accessor :security_tier

    attr_accessor :address_lines

    attr_accessor :barcode

    attr_accessor :nfc

    attr_accessor :driving_licence_information

    attr_accessor :document_classification

    attr_accessor :extracted_data

    # True for **non-restricted** driving licences
    attr_accessor :drivers_licence

    # True for **limited/restricted** driving license, including learner's permits
    attr_accessor :restricted_licence

    # Underlying, non-normalised, licence category (e.g. \"Junior operators license\")
    attr_accessor :raw_licence_category

    # Comma-separated vehicle classes that the user is qualified for
    attr_accessor :raw_vehicle_classes

    # Detailed classes/categories information
    attr_accessor :vehicle_class_details

    attr_accessor :passenger_vehicle

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
        :'date_of_birth' => :'date_of_birth',
        :'date_of_expiry' => :'date_of_expiry',
        :'personal_number' => :'personal_number',
        :'document_numbers' => :'document_numbers',
        :'document_type' => :'document_type',
        :'first_name' => :'first_name',
        :'middle_name' => :'middle_name',
        :'last_name' => :'last_name',
        :'gender' => :'gender',
        :'issuing_country' => :'issuing_country',
        :'nationality' => :'nationality',
        :'issuing_state' => :'issuing_state',
        :'issuing_date' => :'issuing_date',
        :'categorisation' => :'categorisation',
        :'mrz_line1' => :'mrz_line1',
        :'mrz_line2' => :'mrz_line2',
        :'mrz_line3' => :'mrz_line3',
        :'address' => :'address',
        :'place_of_birth' => :'place_of_birth',
        :'spouse_name' => :'spouse_name',
        :'widow_name' => :'widow_name',
        :'alias_name' => :'alias_name',
        :'issuing_authority' => :'issuing_authority',
        :'remarks' => :'remarks',
        :'civil_state' => :'civil_state',
        :'expatriation' => :'expatriation',
        :'father_name' => :'father_name',
        :'mother_name' => :'mother_name',
        :'religion' => :'religion',
        :'type_of_permit' => :'type_of_permit',
        :'version_number' => :'version_number',
        :'document_subtype' => :'document_subtype',
        :'profession' => :'profession',
        :'security_document_number' => :'security_document_number',
        :'tax_number' => :'tax_number',
        :'nist_identity_evidence_strength' => :'nist_identity_evidence_strength',
        :'has_issuance_confirmation' => :'has_issuance_confirmation',
        :'real_id_compliance' => :'real_id_compliance',
        :'security_tier' => :'security_tier',
        :'address_lines' => :'address_lines',
        :'barcode' => :'barcode',
        :'nfc' => :'nfc',
        :'driving_licence_information' => :'driving_licence_information',
        :'document_classification' => :'document_classification',
        :'extracted_data' => :'extracted_data',
        :'drivers_licence' => :'drivers_licence',
        :'restricted_licence' => :'restricted_licence',
        :'raw_licence_category' => :'raw_licence_category',
        :'raw_vehicle_classes' => :'raw_vehicle_classes',
        :'vehicle_class_details' => :'vehicle_class_details',
        :'passenger_vehicle' => :'passenger_vehicle'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'date_of_birth' => :'Date',
        :'date_of_expiry' => :'Date',
        :'personal_number' => :'String',
        :'document_numbers' => :'Array<DocumentPropertiesDocumentNumbersInner>',
        :'document_type' => :'String',
        :'first_name' => :'String',
        :'middle_name' => :'String',
        :'last_name' => :'String',
        :'gender' => :'String',
        :'issuing_country' => :'String',
        :'nationality' => :'String',
        :'issuing_state' => :'String',
        :'issuing_date' => :'Date',
        :'categorisation' => :'String',
        :'mrz_line1' => :'String',
        :'mrz_line2' => :'String',
        :'mrz_line3' => :'String',
        :'address' => :'String',
        :'place_of_birth' => :'String',
        :'spouse_name' => :'String',
        :'widow_name' => :'String',
        :'alias_name' => :'String',
        :'issuing_authority' => :'String',
        :'remarks' => :'String',
        :'civil_state' => :'String',
        :'expatriation' => :'String',
        :'father_name' => :'String',
        :'mother_name' => :'String',
        :'religion' => :'String',
        :'type_of_permit' => :'String',
        :'version_number' => :'String',
        :'document_subtype' => :'String',
        :'profession' => :'String',
        :'security_document_number' => :'String',
        :'tax_number' => :'String',
        :'nist_identity_evidence_strength' => :'String',
        :'has_issuance_confirmation' => :'String',
        :'real_id_compliance' => :'Boolean',
        :'security_tier' => :'String',
        :'address_lines' => :'DocumentPropertiesAddressLines',
        :'barcode' => :'Array<DocumentPropertiesBarcodeInner>',
        :'nfc' => :'DocumentPropertiesNfc',
        :'driving_licence_information' => :'DocumentPropertiesDrivingLicenceInformation',
        :'document_classification' => :'DocumentPropertiesDocumentClassification',
        :'extracted_data' => :'DocumentPropertiesExtractedData',
        :'drivers_licence' => :'Boolean',
        :'restricted_licence' => :'Boolean',
        :'raw_licence_category' => :'String',
        :'raw_vehicle_classes' => :'String',
        :'vehicle_class_details' => :'Array<DocumentWithDriverVerificationReportAllOfPropertiesAllOfVehicleClassDetailsInner>',
        :'passenger_vehicle' => :'DocumentWithDriverVerificationReportAllOfPropertiesAllOfPassengerVehicle'
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
      :'DocumentProperties'
      ]
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Onfido::DocumentWithDriverVerificationReportAllOfProperties` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Onfido::DocumentWithDriverVerificationReportAllOfProperties`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'date_of_birth')
        self.date_of_birth = attributes[:'date_of_birth']
      end

      if attributes.key?(:'date_of_expiry')
        self.date_of_expiry = attributes[:'date_of_expiry']
      end

      if attributes.key?(:'personal_number')
        self.personal_number = attributes[:'personal_number']
      end

      if attributes.key?(:'document_numbers')
        if (value = attributes[:'document_numbers']).is_a?(Array)
          self.document_numbers = value
        end
      end

      if attributes.key?(:'document_type')
        self.document_type = attributes[:'document_type']
      end

      if attributes.key?(:'first_name')
        self.first_name = attributes[:'first_name']
      end

      if attributes.key?(:'middle_name')
        self.middle_name = attributes[:'middle_name']
      end

      if attributes.key?(:'last_name')
        self.last_name = attributes[:'last_name']
      end

      if attributes.key?(:'gender')
        self.gender = attributes[:'gender']
      end

      if attributes.key?(:'issuing_country')
        self.issuing_country = attributes[:'issuing_country']
      end

      if attributes.key?(:'nationality')
        self.nationality = attributes[:'nationality']
      end

      if attributes.key?(:'issuing_state')
        self.issuing_state = attributes[:'issuing_state']
      end

      if attributes.key?(:'issuing_date')
        self.issuing_date = attributes[:'issuing_date']
      end

      if attributes.key?(:'categorisation')
        self.categorisation = attributes[:'categorisation']
      end

      if attributes.key?(:'mrz_line1')
        self.mrz_line1 = attributes[:'mrz_line1']
      end

      if attributes.key?(:'mrz_line2')
        self.mrz_line2 = attributes[:'mrz_line2']
      end

      if attributes.key?(:'mrz_line3')
        self.mrz_line3 = attributes[:'mrz_line3']
      end

      if attributes.key?(:'address')
        self.address = attributes[:'address']
      end

      if attributes.key?(:'place_of_birth')
        self.place_of_birth = attributes[:'place_of_birth']
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

      if attributes.key?(:'issuing_authority')
        self.issuing_authority = attributes[:'issuing_authority']
      end

      if attributes.key?(:'remarks')
        self.remarks = attributes[:'remarks']
      end

      if attributes.key?(:'civil_state')
        self.civil_state = attributes[:'civil_state']
      end

      if attributes.key?(:'expatriation')
        self.expatriation = attributes[:'expatriation']
      end

      if attributes.key?(:'father_name')
        self.father_name = attributes[:'father_name']
      end

      if attributes.key?(:'mother_name')
        self.mother_name = attributes[:'mother_name']
      end

      if attributes.key?(:'religion')
        self.religion = attributes[:'religion']
      end

      if attributes.key?(:'type_of_permit')
        self.type_of_permit = attributes[:'type_of_permit']
      end

      if attributes.key?(:'version_number')
        self.version_number = attributes[:'version_number']
      end

      if attributes.key?(:'document_subtype')
        self.document_subtype = attributes[:'document_subtype']
      end

      if attributes.key?(:'profession')
        self.profession = attributes[:'profession']
      end

      if attributes.key?(:'security_document_number')
        self.security_document_number = attributes[:'security_document_number']
      end

      if attributes.key?(:'tax_number')
        self.tax_number = attributes[:'tax_number']
      end

      if attributes.key?(:'nist_identity_evidence_strength')
        self.nist_identity_evidence_strength = attributes[:'nist_identity_evidence_strength']
      end

      if attributes.key?(:'has_issuance_confirmation')
        self.has_issuance_confirmation = attributes[:'has_issuance_confirmation']
      end

      if attributes.key?(:'real_id_compliance')
        self.real_id_compliance = attributes[:'real_id_compliance']
      end

      if attributes.key?(:'security_tier')
        self.security_tier = attributes[:'security_tier']
      end

      if attributes.key?(:'address_lines')
        self.address_lines = attributes[:'address_lines']
      end

      if attributes.key?(:'barcode')
        if (value = attributes[:'barcode']).is_a?(Array)
          self.barcode = value
        end
      end

      if attributes.key?(:'nfc')
        self.nfc = attributes[:'nfc']
      end

      if attributes.key?(:'driving_licence_information')
        self.driving_licence_information = attributes[:'driving_licence_information']
      end

      if attributes.key?(:'document_classification')
        self.document_classification = attributes[:'document_classification']
      end

      if attributes.key?(:'extracted_data')
        self.extracted_data = attributes[:'extracted_data']
      end

      if attributes.key?(:'drivers_licence')
        self.drivers_licence = attributes[:'drivers_licence']
      end

      if attributes.key?(:'restricted_licence')
        self.restricted_licence = attributes[:'restricted_licence']
      end

      if attributes.key?(:'raw_licence_category')
        self.raw_licence_category = attributes[:'raw_licence_category']
      end

      if attributes.key?(:'raw_vehicle_classes')
        self.raw_vehicle_classes = attributes[:'raw_vehicle_classes']
      end

      if attributes.key?(:'vehicle_class_details')
        if (value = attributes[:'vehicle_class_details']).is_a?(Array)
          self.vehicle_class_details = value
        end
      end

      if attributes.key?(:'passenger_vehicle')
        self.passenger_vehicle = attributes[:'passenger_vehicle']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      nist_identity_evidence_strength_validator = EnumAttributeValidator.new('String', ["superior", "strong", "fair", "weak", "unacceptable", "unspecified_identity_evidence_strength", "unknown_default_open_api"])
      return false unless nist_identity_evidence_strength_validator.valid?(@nist_identity_evidence_strength)
      has_issuance_confirmation_validator = EnumAttributeValidator.new('String', ["true", "false", "unspecified", "unknown_default_open_api"])
      return false unless has_issuance_confirmation_validator.valid?(@has_issuance_confirmation)
      security_tier_validator = EnumAttributeValidator.new('String', ["tier_1", "tier_2", "tier_3", "tier_4", "tier_5", "unspecified_security_tier", "unknown_default_open_api"])
      return false unless security_tier_validator.valid?(@security_tier)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] nist_identity_evidence_strength Object to be assigned
    def nist_identity_evidence_strength=(nist_identity_evidence_strength)
      validator = EnumAttributeValidator.new('String', ["superior", "strong", "fair", "weak", "unacceptable", "unspecified_identity_evidence_strength", "unknown_default_open_api"])
      unless validator.valid?(nist_identity_evidence_strength)
        fail ArgumentError, "invalid value for \"nist_identity_evidence_strength\", must be one of #{validator.allowable_values}."
      end
      @nist_identity_evidence_strength = nist_identity_evidence_strength
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] has_issuance_confirmation Object to be assigned
    def has_issuance_confirmation=(has_issuance_confirmation)
      validator = EnumAttributeValidator.new('String', ["true", "false", "unspecified", "unknown_default_open_api"])
      unless validator.valid?(has_issuance_confirmation)
        fail ArgumentError, "invalid value for \"has_issuance_confirmation\", must be one of #{validator.allowable_values}."
      end
      @has_issuance_confirmation = has_issuance_confirmation
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] security_tier Object to be assigned
    def security_tier=(security_tier)
      validator = EnumAttributeValidator.new('String', ["tier_1", "tier_2", "tier_3", "tier_4", "tier_5", "unspecified_security_tier", "unknown_default_open_api"])
      unless validator.valid?(security_tier)
        fail ArgumentError, "invalid value for \"security_tier\", must be one of #{validator.allowable_values}."
      end
      @security_tier = security_tier
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          date_of_birth == o.date_of_birth &&
          date_of_expiry == o.date_of_expiry &&
          personal_number == o.personal_number &&
          document_numbers == o.document_numbers &&
          document_type == o.document_type &&
          first_name == o.first_name &&
          middle_name == o.middle_name &&
          last_name == o.last_name &&
          gender == o.gender &&
          issuing_country == o.issuing_country &&
          nationality == o.nationality &&
          issuing_state == o.issuing_state &&
          issuing_date == o.issuing_date &&
          categorisation == o.categorisation &&
          mrz_line1 == o.mrz_line1 &&
          mrz_line2 == o.mrz_line2 &&
          mrz_line3 == o.mrz_line3 &&
          address == o.address &&
          place_of_birth == o.place_of_birth &&
          spouse_name == o.spouse_name &&
          widow_name == o.widow_name &&
          alias_name == o.alias_name &&
          issuing_authority == o.issuing_authority &&
          remarks == o.remarks &&
          civil_state == o.civil_state &&
          expatriation == o.expatriation &&
          father_name == o.father_name &&
          mother_name == o.mother_name &&
          religion == o.religion &&
          type_of_permit == o.type_of_permit &&
          version_number == o.version_number &&
          document_subtype == o.document_subtype &&
          profession == o.profession &&
          security_document_number == o.security_document_number &&
          tax_number == o.tax_number &&
          nist_identity_evidence_strength == o.nist_identity_evidence_strength &&
          has_issuance_confirmation == o.has_issuance_confirmation &&
          real_id_compliance == o.real_id_compliance &&
          security_tier == o.security_tier &&
          address_lines == o.address_lines &&
          barcode == o.barcode &&
          nfc == o.nfc &&
          driving_licence_information == o.driving_licence_information &&
          document_classification == o.document_classification &&
          extracted_data == o.extracted_data &&
          drivers_licence == o.drivers_licence &&
          restricted_licence == o.restricted_licence &&
          raw_licence_category == o.raw_licence_category &&
          raw_vehicle_classes == o.raw_vehicle_classes &&
          vehicle_class_details == o.vehicle_class_details &&
          passenger_vehicle == o.passenger_vehicle
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [date_of_birth, date_of_expiry, personal_number, document_numbers, document_type, first_name, middle_name, last_name, gender, issuing_country, nationality, issuing_state, issuing_date, categorisation, mrz_line1, mrz_line2, mrz_line3, address, place_of_birth, spouse_name, widow_name, alias_name, issuing_authority, remarks, civil_state, expatriation, father_name, mother_name, religion, type_of_permit, version_number, document_subtype, profession, security_document_number, tax_number, nist_identity_evidence_strength, has_issuance_confirmation, real_id_compliance, security_tier, address_lines, barcode, nfc, driving_licence_information, document_classification, extracted_data, drivers_licence, restricted_licence, raw_licence_category, raw_vehicle_classes, vehicle_class_details, passenger_vehicle].hash
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
