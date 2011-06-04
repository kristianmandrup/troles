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
    def troles_strategy strategy_name, options = {}, &block
      troles_macros.load_adapter options

      send :include, troles_macros.strategy_module(strategy_name, options)

      troles_macros.set_options! strategy_name, options
      troles_macros.apply_strategy_options! self, options
      
      if block_given?
        (block.arity == 1) ? yield(troles_config) : instance_eval(troles_config)          
      else   
        troles_config
      end
    end     

    def troles_macros
      Troles::Macros
    end

    module ClassMethods
      def set_options! strategy_name, options = {}
        options[:strategy] = strategy_name
        options[:singularity] = extract_singularity(options)
      end      
      
      def strategy_module strategy_name, options = {}
        ns = namespace(strategy_name, options)
        "#{ns}::Strategy::#{strategy_name.to_s.camelize}".constantize
      end  

      def namespace strategy_name, options = {}
        first = (strategy_name =~ /_many$/) ? 'Troles' : 'Trole'      
        orm = options[:orm]
        first << "::#{orm.camelize}" if options[:orm]
        first
      end

      def load_adapter options = {}
        return if !auto_load?(options)
        orm = options[:orm]
        return if !orm || orm.empty?

        path = "troles/adapters/#{orm.to_s.underscore}"
        begin
          require path
        rescue
          raise "Adapter for :#{orm} could not be found at: #{path}"
        end
      end
      
      def apply_strategy_options! clazz, options
        clazz.troles_config.apply_options! options

        StrategyOptions.new(clazz)
        extract_macros(options).each{|m| apply_macro m}
      end      

      protected

      def auto_load? options = {}
        (options[:auto_load] && options[:orm]) || false
      end
      
      def extract_macros options = {}
        [:static_role].select {|o| options[o]}
      end

      def extract_singularity options = {}
        (options[:strategy].to_s =~ /_many$/) ? :many : :single
      end
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
