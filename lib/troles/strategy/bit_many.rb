module Troles
  module Strategy
    module BitMany
      include BaseMany

      # saves the role for the user in the data store
      def set_roles *roles
        trole = valid_roles(roles)
      end  

      # clears the role of the user in the data store
      def clear!
        trole = 0
      end  
    end
  end
end