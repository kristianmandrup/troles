#
# @author Kristian Mandrup
# 
# Common Validation API
#
module TroleGroups::Api
  module Validation

    # @return [Symbol, false] returns the role if it's valid, false if not
    def check_valid_rolegroup? rolegroup
      return rolegroup if valid_rolegroups.include? rolegroup.to_sym
      false
    end

    # @return [Array<Symbol>] returns the valid roles or empty list if no valid roles
    def check_valid_rolegroups? *rolegroups
      valid_rolegroups & rolegroups.to_symbols     
    end
    
    protected

    # Ensures the role is valid
    # @param [Symbol] role name
    # @return [Symbol, false, Error] a valid role name, false if invalid, or Error on some error
    def make_valid_rolegroup rolegroup
      raise ArgumentError, "Rolegroup to set must be a Symbol or String" if !rolegroup.kind_of_label?
      check_valid_rolegroup? rolegroup.to_s.alpha_numeric
    end

    # Ensures the role are valid
    # @param [Symbol] list of roles
    # @return [Array<Symbol>] the valid roles from the list of roles given
    def make_valid_rolegroups *rolegroups      
      rolegroups = rolegroups.to_symbols_uniq
      return [] if rolegroups.empty?                
      check_valid_rolegroups? rolegroups.map{|r| r.to_s.alpha_numeric}
    end

    # @return [Array<Symbol>] the valid roles of the role subject
    def valid_rolegroups
      self.class.trolegroups_config.valid_rolegroups
    end
  end
end