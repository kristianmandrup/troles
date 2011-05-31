module Troles
  module Calculator
    class Bitmask          
      attr_accessor :valid_roles

      def initialize *valid_roles
        @valid_roles = valid_roles.to_symbols
      end

      def calc_index(r)
        2**valid_roles.index(r)
      end

      def get_roles number      
        raise ArgumentError, "to get roles from bitmask, a number must be passed as argument, was: #{number.inspect}" if !number.is_a?(Numeric) 
        raise "Valid roles have not been defined" if !valid_roles || valid_roles.empty?
        valid_roles.reject do |r| 
          ((number || 0) & calc_index(r)).zero?
        end
      end

      def calc_bitmask *roles
        roles.to_symbols.map { |r| calc_index(r) }.inject { |sum, bitvalue| sum + bitvalue }          
      end
    end
  end
end