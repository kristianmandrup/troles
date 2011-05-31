module Trole::Api
  module Event
    # a change to the roles of the user should be published to an event handler
    # this can be used to update both the Role cache of the user and fx the RolePermit cache.
    # Both (and potentially others, fx for Role Groups) can subscribe to this event!

    def update_roles
      publish_change(:roles) if field_changed?(self.class.role_field)
    end

    # check if a field on the model changed
    # See http://api.rubyonrails.org/classes/ActiveModel/Dirty.html
    def field_changed? name
      begin
        send :"#{name}_changed?"
      rescue
        false
      end
    end

    # can be customized
    # here uses singleton EventManager
    def publish_change event
      event_manager.publish_change event, :from => self
    end  
    
    def event_manager
      Trole::EventManager
    end
  end
end