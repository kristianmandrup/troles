module Trole
  module Strategy
    module EmbedOne
      include BaseOne

      def strategy
        @strategy ||= Storage.new self
      end

      class Storage < Trole::Storage::Generic
        def initialize api        
          super
        end

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