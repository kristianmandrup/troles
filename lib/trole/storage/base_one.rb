#
# @author Kristian Mandrup
#
# Single role base storage (common, reusable functionality) 
#

module Trole::Storage
  class BaseOne < Troles::Common::Storage

    # constructor
    # @param [Symbol] the role subject
    def initialize role_subject
      super
    end      
    
    # get Role instance by name
    # @param  [Symbol] list of role names to find Roles for
    # @return [Role] reference to Role instances
    def find_role role
      raise ArgumentError, "Must be a role label" if !role.kind_of_label?
      role_model.where(:name => role.to_s)
    end

    # get embedded Role instances
    # @param  [Array<Symbol>] list of role names
    # @return [Array<Role>] Role instances generated      
    def role_to_embed
      raise "Must be implemented by embed storage to generate a set of roles to embed"
    end                 
    
    def role_model
      role_subject.class.troles_config.role_model
    end

    # saves the role for the user in the data store
    def set_roles *roles
      raise ArgumentError, "A single role strategy can only allow setting a single role, was: #{roles}" if (roles.size > 1)
      set_role roles.flat_uniq.first
    end  
    
    # sets the role to its default state    
    def set_default_role!
      clear!
    end    
  end        
end
