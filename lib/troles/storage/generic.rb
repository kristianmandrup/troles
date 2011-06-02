# @author Kristian Mandrup
#
# @note all methods potentially operate directly on values in the data store
#
module Troles
  module Storage
    class Generic
      attr_reader :role_subject

      # initializes storage with reference to role subject
      def initialize role_subject
        @role_subject = role_subject
      end      

      # valid roles of the role subjects class (fx account - i.e the account rules!)
      # @return [Array<Symbol>] the list of valid roles
      def valid_roles
        role_subject.class.valid_roles
      end        

      # name/type of storage
      def name
        :generic
      end 

      # sets the value of the role field (@trole or @troles) and persists the value (in the data store)
      def set_ds_field value
        role_subject.send(:"#{ds_field_name}=", value)
        persist_role_changes!
      end

      # the name of the role field
      # @return [Symbol] the name
      def ds_field_name
        role_subject.class.role_field
      end

      # the current value of the role field
      # @return [Object] the value
      def ds_field_value
        role_subject.send(role_subject.class.role_field)
      end      

      # Attempts to persist the role field changes
      # @return [true, false, error] true if saved, false if no save! method, Error on some error
      def persist_role_changes!
        return false if !role_subject.respond_to? :save!
        role_subject.save! 
        role_subject.publish_change :roles
      end 

      protected

      def role_list
        role_subject.role_list
      end

      # get matching list of Role instances
      # @param  [Array<Symbol>] list of role names to find Roles for
      # @return [Array<Role>] references to Role instances
      def find_roles *roles
        Role.where(:name => roles)
      end

      # get list of embedded Role instances
      # @param  [Array<Symbol>] list of role names
      # @return [Array<Role>] Role instances generated      
      def roles_to_embed
        raise "Must be implemented by embed storage to generate a set of roles to embed"
      end           
    end        
  end
end