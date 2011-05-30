module Troles
  module Strategy
    module StringMany
      include BaseMany

      class Storage < GenericStorage

        def initialize api
          super
        end
        
        # saves the role for the user in the data store
        def set_roles roles
          troles = roles
        end  

        # clears the role of the user in the data store
        def clear!
          trole = ""
        end
      end
    end
  end
end