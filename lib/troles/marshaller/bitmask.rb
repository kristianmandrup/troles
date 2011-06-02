module Troles
  module Marshaller
    class Bitmask < Generic
      attr_reader :role_subject, :valid_roles

      def initialize role_subject
        super
      end

      def read
        valid_roles.reject do |r| 
          num = as_number(ds_field_value) 
          ((num || 0) & calc_index(r)).zero?
        end
      end

      def write *roles
        roles.to_symbols.map { |r| calc_index(r) }.inject { |sum, bitvalue| sum + bitvalue }          
      end
      
      protected

      def as_number value
        case value
        when TrueClass, FalseClass
          value ? 2 : 1
        when Fixnum
          value 
        else
          raise ArgumentError, "Cant be converted to a bit index, #{value}"
        end
      end
        
      def calc_index(r)
        2**valid_roles.index(r)
      end        
    end
  end
end