module Troles
  module Strategy
    module BitMany
      include BaseMany

      def strategy
        @strategy ||= Storage.new self
      end

      class Storage < GenericStorage

        def initialize api
          super
        end
        
        # saves the role for the user in the data store
        def set_roles *roles
          trole = bitmask(valid_roles).calc_bitmask(roles)
        end  

        # clears the role of the user in the data store
        def clear!
          trole = 0
        end  

        protected

        def bitmask valid_roles
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

          def get_roles bitmask
            valid_roles.reject { |r| ((bitmask || 0) & calc_index(r)).zero? })        
          end

          def bitmask
            roles.map { |r| calc_index(r) }.inject { |sum, bitvalue| sum + bitvalue }          
          end
        end
      end
    end
  end
end