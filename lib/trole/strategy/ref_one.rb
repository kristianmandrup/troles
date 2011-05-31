module Trole
  module Strategy
    module RefOne
      include BaseOne

      def strategy
        @strategy ||= Storage.new
      end

      class Storage < GenericStorage        
        # saves the role for the user in the data store
        def set_role role
          trole = Role.where(:name => role).first
        end  

        # clears the role of the user in the data store
        def set_default_role!
          trole = nil
        end  
      end
    end
  end
end