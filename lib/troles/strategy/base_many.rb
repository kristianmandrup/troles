# Base module for Many strategy
module Troles
  module Strategy    
    module BaseMany
      
      def self.included(base)
        base.send :include, Troles::Api
        base.send :extend,  Troles::Api
        base.send :attr_accessor, base.role_field        
      end
            
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
          raise "Must be implemented by Strategy"
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