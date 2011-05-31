module Troles
  module Strategy
    module RefMany
      include BaseMany

      def strategy
        @strategy ||= Storage.new self
      end

      class Storage < Troles::Storage::Generic

        def initialize api
          super
        end
        
        # saves the role for the user in the data store
        def set_roles *roles
          # finds and sets references to existing Role instances from symbols        
          troles = find_roles *roles
        end  

        # clears the role of the user in the data store
        def clear!
          troles = []
        end
        
        # clears the role of the user in the data store
        def set_default_role!
          clear!
          # set_roles api.default_role
        end                            
      end
    end
  end
end