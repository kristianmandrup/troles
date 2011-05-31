module Troles  
  module Macros
    def role_strategy strategy_name, options = {}    
      macros = Troles::Customize
      send :include, macros.strategy_module(strategy_name)
      macros.apply_strategy_options! self, options
    end  
  end  
end

Module.send :include, Troles::Macros
