module TroleGroups::Api
  module Core
    # Access to the Troles operations API
    # @return [Troles::Operations] the operations API object 
    def rolegroups
      @rolegroups ||= TroleGroups::Operations.new(self)
    end       

    # Sets the roles of the subject
    # (see #set_roles)
    def rolegroups= *new_rolegroups
      rolegroups.set_rolegroups new_rolegroups
    end       

    # If this role subject instance should have static (immutable) roles
    # @return [true, false] defaults to false so a role subject is allowed to change roles 
    def static_roles?
      false
    end

    def trolegroups_config
      self.class.trolegroups_config      
    end
      
    module ClassMethods            
    
      def valid_rolegroups
        trolegroups_config.valid_roles
      end

      # # TODO: make sure alphanumeric only
      # def valid_roles= *roles
      #   troles_config.valid_roles = *roles
      # end

      # If all role subjects using this strategy should have static (immutable) roles
      #
      # @note Should also proxy Config object?      
      #
      # @return [true, false] if role subjects have static roles or not (default: false)
      def static_roles?
        trolegroups_config.static_roles?
      end           
    end
  end
end