module Troles
  module Api
    autoload :Core,       'troles/api/core'
    autoload :Event,      'troles/api/event'
    autoload :Read,       'troles/api/read'
    autoload :Store,      'troles/api/store'    
    autoload :Validation, 'troles/api/validation'
    autoload :Write,      'troles/api/write'

    module ClassMethods    
      def included(base)
        apis.each do |api|
          begin
            base.send :include, "Troles::Api::#{api.to_s.camelize}".constantize
            base.send :extend,  "Troles::Api::#{api.to_s.camelize}::ClassMethods".constantize
          rescue
          end
        end  
      end

      def apis
        [:core, :event, :read, :store, :validation, :write]
      end
    end    
    extend ClassMethods
  end
end