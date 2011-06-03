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
      sole_subject.class.role_model
    end
  end        
end
