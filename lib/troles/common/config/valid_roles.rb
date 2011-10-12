# 
# @author Kristian Mandrup
#
# Valid roles module
# Adds methods for operating on/with valid roles
#
module Troles::Common
  class Config
    module ValidRoles    
      # Add a list of valid roles
      # @param [Array<Symbol>] names of roles to make valid
      def add_valid_roles *roles
        valid_roles =valid_roles & roles
      end

      # Set a list of valid roles
      # @param [Array<Symbol>] names of roles to make valid
      def valid_roles= *roles
        vrs = roles.flatten.map{|r| r.to_s.alpha_numeric}.map(&:to_sym).uniq

        raise ArgumentError, "The #{strategy} strategy can only accept 2 valid roles" if (vrs.size > 2) && strategy == :bit_one
        raise ArgumentError, "The role names you want to be valid are not valid role names. Must be alphanumeric, was: #{roles.flatten}" if vrs.empty?
        @valid_roles ||= vrs
      end

      # Get the list of valid roles
      # @return [Array<Symbol>] names of roles that are currently valid
      def valid_roles
        raise "No valid roles defined" if !@valid_roles || @valid_roles.empty?
        @valid_roles
      end
    end
  end
end
