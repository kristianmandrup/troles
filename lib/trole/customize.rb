module Trole
  module Customize
    module StaticRole
      def static_role?
        true
      end
    end

    module Macros
      def apply_strategy_options! clazz, options
        clazz.send :include,  Trole::Customize::StaticRole # overrides default method that returns false 
        clazz.send :extend,   Trole::Customize::StaticRole
      end

      def strategy_module strategy_name
        "Trole::Strategy::#{strategy_name.to_s.camelize}".constantize
      end  
    end
    extend Macros
    
  end  
end