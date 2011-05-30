module Trole
  module Strategy
    module BitOne
      include BaseOne

      def strategy
        @strategy ||= Storage.new
      end

      class Storage < GenericStorage        
        # saves the role for the user in the data store
        def set_role role
          trole = role ? 1 : 0
        end  

        # clears the role of the user in the data store
        def clear!
          trole = 0
        end  
      end
    end
  end
end