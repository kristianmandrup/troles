module Troles
  module Strategy
    module EmbedMany
      include BaseMany

      def strategy
        @strategy ||= Storage.new self
      end

      class Storage < Troles::Storage::Generic

        def initialize api
          super
        end
        
        # saves the role for the user in the data store
        def set_roles *roles
          # creates and embeds new Role instances from symbols
          troles = embedded_roles *roles
        end  

        def embedded_roles
          roles.map {|name| Role.new :name => name }
        end

        # clears the role of the user in the data store
        def clear!
          troles = []
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