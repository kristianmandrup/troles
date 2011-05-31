module Trole
  module Strategy
    module EmbedOne
      include BaseOne

      def strategy
        @strategy ||= Storage.new
      end

      class Storage < GenericStorage
        # saves the role for the user in the data store
        def set_role role
          trole = Role.new :name => role
        end  
        
        def set_default_role!
          trole = []
        end          
      end      
    end
  end
end