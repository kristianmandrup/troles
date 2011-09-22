#
# @author Kristian Mandrup
# 
# Common Validation API
#
module Troles::Common::Api
  module Validation

    # @return [Symbol, false] returns the role if it's valid, false if not
    def check_valid_role? role
      return role if valid_roles.include? role.to_sym
      false
    end

    # @return [Array<Symbol>] returns the valid roles or empty list if no valid roles
    def check_valid_roles? *roles
      valid_roles & roles.to_symbols
    end

    protected

    # Ensures the role is valid
    # @param [Symbol] role name
    # @return [Symbol, false, Error] a valid role name, false if invalid, or Error on some error
    def make_valid_role role
      raise ArgumentError, "Role to set must be a Symbol or String" if !role.kind_of_label?
      check_valid_role? role.to_s.alpha_numeric
    end

    # Ensures the role are valid
    # @param [Symbol] list of roles
    # @return [Array<Symbol>] the valid roles from the list of roles given
    def make_valid_roles *roles
      roles = roles.to_symbols_uniq
      return [] if roles.empty?
      check_valid_roles? roles.map{|r| r.to_s.alpha_numeric}
    end

    # @return [Array<Symbol>] the valid roles of the role subject
    def valid_roles
      self.class.troles_config.valid_roles
    end
  end
end
