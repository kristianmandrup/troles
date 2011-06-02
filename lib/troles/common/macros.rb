module Troles  
  module Macros
    def role_strategy strategy_name, options = {}
      send :include, troles_macros.strategy_module(strategy_name)
      troles_macros.apply_strategy_options! self, options
    end     

    def troles_macros
      Troles::Macros
    end

    module ClassMethods
      def strategy_module strategy_name
        "#{namespace strategy_name}::Strategy::#{strategy_name.to_s.camelize}".constantize
      end  

      def namespace strategy_name
        (strategy_name =~ /_many$/) ? 'Troles' : 'Trole'      
      end
      
      def apply_strategy_options! clazz, options
        StrategyOptions.new(clazz)
        extract_macros(options).each{|m| apply_macro m}
      end      
      
      def extract_macros options = {}
        [:static_role].select {|o| options[o]}
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
