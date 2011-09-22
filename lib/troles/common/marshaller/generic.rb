module Troles::Common
  module Marshaller
    class Generic
      attr_reader :role_subject, :valid_roles

      def initialize role_subject
        raise "The roles subject is not valid: #{role_subject}" if !role_subject || !role_subject.respond_to?(:has_role?)
        @role_subject = role_subject
        @valid_roles = role_subject.class.valid_roles
      end

      protected

      def ds_field_value
        role_subject.send ds_field_name
      end

      def ds_field_name
        @ds_field_name ||= role_subject.class.role_field
      end
    end
  end
end

