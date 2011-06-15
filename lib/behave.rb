require 'behave/macros'

module Behave
  autoload :Config,   'behave/config'

  module ClassMethods
    attr_accessor :behaviors

    # Add a new behavior to the global set of available behaviors!
    # The behaviors contained here can later be added to subject classes
    def add_behavior name, &block
      new_behavior = create_behavior name
      behaviors << new_behavior
      yield new_behavior
      new_behavior
    end 

    def behaviors
      @behaviors ||= Set.new
    end
    
    def create_behavior name
      Behave::Decorator.new name
    end
  end
  
  extend ClassMethods
end