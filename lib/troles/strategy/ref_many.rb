module Troles
  module Strategy
    module RefMany
      include BaseMany

      # saves the role for the user in the data store
      def set_roles roles        
        # finds and sets references to existing Role instances from symbols        
        troles = Role.where(:name => valid_roles(roles))
      end  

      # clears the role of the user in the data store
      def clear!
        troles = []
      end
    end
  end
end