# @author Kristian Mandrup
#
# Troles base storage for Many roles strategies
#
module Troles
  module Storage
    class BaseMany < Troles::Common::Storage
      protected

      # get matching list of Role instances
      # @param  [Array<Symbol>] list of role names to find Roles for
      # @return [Array<Role>] references to Role instances
      def find_roles *roles
        role_model.where(:name => roles.flatten).all
      end

      # get list of embedded Role instances
      # @param  [Array<Symbol>] list of role names
      # @return [Array<Role>] Role instances generated
      def roles_to_embed *roles
        raise "Must be implemented by embed storage to generate a set of roles to embed"
      end
    end
  end
end
