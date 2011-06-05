#
# @author Kristian Mandrup
# 
# Event API
#
module Troles::Common::Api
  module Event
    # A change to the roles of the user should be published to an event handler
    # this can be used to update both the Role cache of the user and fx the RolePermit cache.
    # A Role Groups listener can also subscribe to this event
    def update_roles
      publish_change(:roles) if role_field_changed?(troles_config.role_field)
    end

    # Check if a field on the model changed
    # For Rails 3, See http://api.rubyonrails.org/classes/ActiveModel/Dirty.html
    # @param [String] the field to test for change
    def role_field_changed? name
      begin
        send :"#{name}_changed?"
      rescue
        false
      end
    end

    # Publishes change event to the EventManager configured
    # The EventManager is notied of the even type and who (which instance) sent it
    # @param [Symbol] the event
    def publish_change event
      send :invalidate_role_cache! if event == :roles
      event_manager.publish_change event, :from => self
    end

    # @return [Trole::EventManager] The event manager singleton (class) to use to handle role events 
    def event_manager
      Troles::Common::EventManager
    end
  end
end