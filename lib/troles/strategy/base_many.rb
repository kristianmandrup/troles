# Base module for Many strategy
module Troles
  module Strategy    
    module BaseMany
      include Api      
            
      class << self
        def set_roles *roles
          raise "Must be implemented by Strategy"
        end

        def clear!
          raise "Must be implemented by Strategy"
        end

        # clears the role of the user in the data store
        def set_default_role!
          clear!
        end  

        def persist_role_changes!
          # raise "Must be implemented by Strategy"
          puts "persisted!"
        end
        
        def find_roles *roles
          Role.where(:name => roles)
        end
        
        def embedded_roles
          []
        end        
      end      
    end
  end
end