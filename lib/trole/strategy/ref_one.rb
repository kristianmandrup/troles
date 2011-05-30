module Troles
  module Strategy
    module RefOne
      include BaseOne

      # saves the role for the user in the data store
      def set_role role
        trole = Role.where(:name => valid_role role).first
      end  

      # clears the role of the user in the data store
      def clear!
        trole = ""
      end  

      module ClassMethods
        def set_valid_role role
          raise ArgumentError, "Role to set must be a Symbol or String" if !role.kind_of_label?
          @valid_role = role
        end      
      end
    end
  end
end