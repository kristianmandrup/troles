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

        def persist_role_changes!
          # raise "Must be implemented by Strategy"
          puts "persisted!"
        end
      end      
    end
  end
end