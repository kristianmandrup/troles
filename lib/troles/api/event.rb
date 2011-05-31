require 'trole/api/event'

module Troles::Api
  module Event    
    include Trole::Api::Event
    
    def event_manager
      Troles::EventManager
    end    
  end
end