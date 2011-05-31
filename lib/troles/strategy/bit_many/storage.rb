module Troles::Strategy::BitMany
  class Storage < Troles::Storage::Generic
    def initialize api
      super
    end

    def display_roles
      bitmask.get_roles(ds_field)
    end
  
    # saves the role for the user in the data store
    def set_roles *roles
      set_ds_field bitmask.calc_bitmask(roles)
    end  

    # clears the role of the user in the data store
    def clear!
      set_default_role!
    end
  
    # clears the role of the user in the data store
    def set_default_role!
      set_ds_field 0
    end            

    protected

    def bitmask
      @bitmask ||= Bitmask.new valid_roles
    end

    class Bitmask          
      attr_accessor :valid_roles
    
      def initialize valid_roles
        @valid_roles = valid_roles
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

      def calc_bitmask roles
        roles.map { |r| calc_index(r) }.inject { |sum, bitvalue| sum + bitvalue }          
      end
    end
  end
end