module Trole
  module Api
    autoload :Core,        'trole/api/core'
    autoload :Event,       'trole/api/event'
    autoload :Read,        'trole/api/read'
    autoload :Store,       'trole/api/store'    
    autoload :Validation,  'trole/api/validation'
    autoload :Write,       'trole/api/write'    

    def self.included(base)
      apis.each do |api|
        begin
          # base.include_and_extend :StaticRole          
          base.send :include, "Trole::Api::#{api.to_s.camelize}".constantize
        rescue
        end
      end
    end

    module ClassMethods
      attr_accessor :valid_roles

      def apis
        [:core, :event, :read, :store, :validation, :write]
      end
            
      def role_field
        :trole
      end
    end
    extend ClassMethods    
  end
end