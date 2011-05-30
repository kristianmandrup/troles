module Trole
  module EventApi
    # a change to the roles of the user should be published to an event handler
    # this can be used to update both the Role cache of the user and fx the RolePermit cache.
    # Both (and potentially others, fx for Role Groups) can subscribe to this event!

    def update_roles
     publish_change(:roles) if field_changed?(role_field)
    end

    # check if a field on the model changed
    # See http://api.rubyonrails.org/classes/ActiveModel/Dirty.html
    def field_changed? name
     send :“#{name}_changed?”
    end

    # can be customized
    # here uses singleton EventManager
    def publish_change event
      Trole::EventManager.publish_change event, :from => self
    end  
  end
end