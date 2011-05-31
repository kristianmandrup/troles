class Class
  def self.role_strategy strategy_name, options = {}    
    macros = RoleStrategyMacros
    send :include, macros.strategy_module(strategy_name)
    macros.apply_strategy_options! self, options
  end
  
  protected

  module RoleStrategyMacros
    module StaticRole
      def static_role?
        true
      end
    end
    
    class << self
      def apply_strategy_options! clazz, options
        class.send :include,  StaticRole # overrides default method that returns false 
        class.send :extend,   StaticRole
      end
  
      def strategy_module strategy_name
        ns = (strategy_name =~ /_many$/) ? "Troles" : "Trole"
        "#{ns}::Strategy::#{strategy_name}".constantize
      end  
    end
  end
end