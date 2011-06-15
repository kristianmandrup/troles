module Behave
  class Decorator
    autoload :Configuration, 'behave/decorator/configuration'
    
    attr_accessor :name, :configuration_class

    def initialize name
      @name = name
    end
    
    def internal_api name
    end

    def public_api name
    end

    def configuration_class
      @configuration_class || Configuration
    end
        
    def configure strategy, options = {}, &block
      configuration = configuration_class.new self, strategy, options

      configuration.load_adapter
      puts "strategy module: #{configuration.strategy_module}"
      puts configuration.strategy_module.methods.grep /store/ 
      
      send :include, configuration.strategy_module

      configuration.define_hooks
      configuration.apply_strategy_options!

      if strategy == :bit_one 
        behavior_config.valid_roles = [:user, :admin] # default binary roles 
      end
      
      yield behavior_config if block_given?
      behavior_config
    end    
  end
end

