module Troles
  module Api
    autoload :Core,       'troles/api/core'
    autoload :Event,      'troles/api/event'
    autoload :Read,       'troles/api/read'
    autoload :Store,      'troles/api/store'    
    autoload :Validation, 'troles/api/validation'
    autoload :Write,      'troles/api/write'

    def self.included(base)
      apis.each do |api|
        begin
          base.send :include, "Troles::Api::#{api.to_s.camelize}".constantize
        rescue
        end
      end  
      base.extend ClassMethods
    end

    module ClassMethods    
      attr_accessor :valid_roles
      
      def apis
        [:core, :event, :read, :store, :validation, :write]
      end
      
      def role_field
        :troles
      end        
      
      def static_roles?
        false
      end      
    end    
    extend ClassMethods
  end
end