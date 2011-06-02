module Trole::Api
  module Event
    # @return [Trole::EventManager] The event manager singleton (class) to use to handle role events 
    def event_manager
      Trole::EventManager
    end
  end
end