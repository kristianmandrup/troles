require 'behave/macros'

module Behave
  autoload :Config,       'behave/config'
  autoload :Decorator,    'behave/decorator'

  autoload :BaseLoader,     'behave/loaders/base_loader'
  autoload :ConfigLoader,   'behave/loaders/config_loader'
  autoload :StrategyLoader, 'behave/loaders/strategy_loader'
  autoload :StorageLoader,  'behave/loaders/storage_loader'      


  module ClassMethods
    attr_accessor :behaviors

    # Add a new behavior to the global set of available behaviors!
    # The behaviors contained here can later be added to subject classes
    def add_behavior name, &block
      new_behavior = create_behavior name
      behaviors[name] = new_behavior
      yield new_behavior if block
      new_behavior
    end 

    def behaviors
      @behaviors ||= {}
    end

    private
    
    def create_behavior name
      Behave::Decorator.new name
    end
  end
  
  extend ClassMethods
end