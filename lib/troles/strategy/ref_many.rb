module Troles
  module Strategy
    module RefMany
      include BaseMany

      def strategy
        @strategy ||= Storage.new self
      end

      class Storage < GenericStorage

        def initialize api
          super
        end
        
        # saves the role for the user in the data store
        def set_roles roles        
          # finds and sets references to existing Role instances from symbols        
          troles = Role.where(:name => roles)
        end  

        # clears the role of the user in the data store
        def clear!
          troles = []
        end
      end
    end
  end
end