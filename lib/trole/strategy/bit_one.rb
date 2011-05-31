module Trole
  module Strategy
    module BitOne # boolean flag
      include BaseOne

      def strategy
        @strategy ||= Storage.new
      end

      class Storage < GenericStorage        
        # saves the role for the user in the data store
        def set_role role
          trole = role ? true : false # boolean field in Data store
        end  
        
        def set_default_role!
          trole = false
        end
      end
    end
  end
end