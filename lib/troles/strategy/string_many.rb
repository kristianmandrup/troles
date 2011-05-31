module Troles
  module Strategy
    module StringMany
      include BaseMany

      class Storage < Troles::Storage::Generic

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
        
        # clears the role of the user in the data store
        def set_default_role!
          clear!
          # set_roles api.default_role
        end        
      end
    end
  end
end