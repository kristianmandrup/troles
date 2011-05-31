module Trole
  module Api
    autoload :Core,        'trole/api/core'
    autoload :Event,       'trole/api/event'
    autoload :Read,        'trole/api/read'
    autoload :Store,       'trole/api/store'    
    autoload :Validation,  'trole/api/validation'
    autoload :Write,       'trole/api/write'    


    module ClassMethods
      def included(base)
        apis.each do |api|
          begin
            base.send :include, "Trole::Api::#{api.to_s.camelize}".constantize
            base.send :extend,  "Trole::Api::#{api.to_s.camelize}::ClassMethods".constantize
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