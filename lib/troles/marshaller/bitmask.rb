module Troles
  module Marshaller
    class Bitmask < Generic
      attr_reader :role_subject, :valid_roles

      def initialize role_subject
        super
      end

      def read
        valid_roles.reject do |r| 
          ((ds_field_value || 0) & calc_index(r)).zero?
        end
      end

      def write *roles
        roles.to_symbols.map { |r| calc_index(r) }.inject { |sum, bitvalue| sum + bitvalue }          
      end
      
      protected
        
      def calc_index(r)
        2**valid_roles.index(r)
      end        
    end
  end
end