# @author Kristian Mandrup
#
# Generic Troles storage
#
module Troles
  module Storage
    class BaseMany < Troles::Common::Storage
      protected
      
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