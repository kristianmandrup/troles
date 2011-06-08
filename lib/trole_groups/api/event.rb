module TroleGroups::Api
  module Event
    # a change to the roles of the user should be published to an event handler
    # this can be used to update both the Role cache of the user and fx the RolePermit cache.
    # Both (and potentially others, fx for Role Groups) can subscribe to this event!
    def update_role_groups
      publish_change(:role_groups) if field_changed?(rolegroups_field)
    end

    # check if a field on the model changed
    # See http://api.rubyonrails.org/classes/ActiveModel/Dirty.html
    def field_changed? name
     send :"#{name}_changed?"
    end

    # can be customized
    # here uses singleton EventManager
    def publish_change event
      send :invalidate_rolegroups_cache! if event == :role_groups
      event_manager.publish_change event, :from => self
    end
    
    protected
    
    def event_manager
      Troles::Common::EventManager
    end      
  end
end