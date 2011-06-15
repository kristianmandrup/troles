module Behave
  class Config
    module ClassMethods
      attr_reader :default_orm, :auto_load
      attr_accessor :log_on

      def log_on?
        log_on || false
      end
  
      def default_orm= orm
        @default_orm ||= orm
      end
  
      def auto_load= mode
        raise "Autoload must be set to true or false" if ![true, false].include? mode
        @auto_load = mode
      end

      def auto_load?
        @auto_load
      end      

      def auto_config
        auto_config_setings
      end 
  
      def auto_config? name
        auto_config_setings[name]
      end
  
      protected

      def auto_config_setings
        @auto_config_setings ||= auto_config_defaults
      end

      # default auto_config settings
      def auto_config_defaults
        {:models => true, :relations => true, :fields => true}
      end      
    end
  end
end