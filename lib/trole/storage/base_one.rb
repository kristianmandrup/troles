module Trole
  module Storage
    class BaseOne < Troles::Common::Storage
      def initialize role_subject
        super
      end      
      
      # get Role instance by name
      # @param  [Symbol] list of role names to find Roles for
      # @return [Role] reference to Role instances
      def find_role role
        raise ArgumentError, "Must be a role label" if !role.kind_of_label?
        Role.where(:name => role.to_s)
      end

      # get embedded Role instances
      # @param  [Array<Symbol>] list of role names
      # @return [Array<Role>] Role instances generated      
      def role_to_embed
        raise "Must be implemented by embed storage to generate a set of roles to embed"
      end                 
    end        
  end
end