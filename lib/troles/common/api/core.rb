#
# @author Kristian Mandrup
#
# Core Troles API functions
#
module Troles::Common::Api
  module Core
    
    # Access to the Troles operations API
    # @return [Troles::Operations] the operations API object 
    def roles
      @roles ||= Troles::Operations.new(self)
    end       

    # Sets the roles of the subject
    # (see #set_roles)
    def roles= *new_roles
      roles.set_roles new_roles
    end       

    # If this role subject instance should have static (immutable) roles
    # @return [true, false] defaults to false so a role subject is allowed to change roles 
    def static_roles?
      return self.class.static_roles? if self.class.respond_to? :static_roles?
      false
    end
        
    module ClassMethods            
      
      def role_model
        troles_config.role_model
      end

      def role_model= name
        troles_config.role_model= name
      end
      
      def valid_roles
        troles_config.valid_roles
      end

      # TODO: make sure alphanumeric only
      def valid_roles= *roles
        troles_config.valid_roles = *roles
      end

      # If all role subjects using this strategy should have static (immutable) roles
      #
      # @note Should also proxy Config object?      
      #
      # @return [true, false] if role subjects have static roles or not (default: false)
      def static_roles?
        false
      end           
    end
  end
end