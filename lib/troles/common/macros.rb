# 
# @author Kristian Mandrup
#
# Macros that can be used directly on the role subject class 
# These methods are added to the ruby core 'Module' module
#
# Usage:
#   class User
#     troles_strategy :bit_many
#

puts "Troles macros enabled!"

module Troles  
  module Macros
    autoload :ClassMethods, 'troles/common/macros/class_methods'
    
    def troles_strategy strategy_name, options = {}, &block
      troles_macros.load_adapter options
      strat_module = troles_macros.strategy_module(strategy_name, options)

      puts "strategy module used: #{strat_module}"
      send :include, strat_module

      troles_macros.set_options! strategy_name, options
      troles_macros.apply_strategy_options! self, options
      troles_macros.define_hooks self, options
      
      if strategy_name == :bit_one 
        troles_config.valid_roles = [:user, :admin] # default binary roles 
      end
      
      yield troles_config if block_given?
      troles_config
    end     

    def troles_macros
      Troles::Macros
    end


    extend ClassMethods
    
    class StrategyOptions
      attr_reader :clazz
      
      def initialize clazz
        @clazz = clazz
      end

      # @param [Symbol] name of the macro to run
      def apply_macro name
        # overrides default method that returns false
        begin 
          clazz.send :include,  "Troles::Macros::#{strategy_name.to_s.camelize}".constantize
        rescue
        end
      end
    end
  end  
end

Module.send :include, Troles::Macros
