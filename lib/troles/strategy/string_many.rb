module Troles
  module Strategy
    module StringMany
      include BaseMany

      # saves the role for the user in the data store
      def set_roles roles
        troles = valid_roles(roles)
      end  

      # clears the role of the user in the data store
      def clear!
        trole = ""
      end
    end
  end
end