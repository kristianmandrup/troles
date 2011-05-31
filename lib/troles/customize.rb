module Troles
  module Customize
    module StaticRole
      def static_roles?
        true
      end
    end

    class << self
      def apply_strategy_options! clazz, options
        clazz.send :include,  Troles::Customize::StaticRole # overrides default method that returns false 
        clazz.send :extend,   Troles::Customize::StaticRole
      end

      def strategy_module strategy_name
        "Troles::Strategy::#{strategy_name.to_s.camelize}".constantize
      end  
    end
  end  
end