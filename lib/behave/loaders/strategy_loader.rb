module Behave
  class StrategyLoader < BaseLoader

    def initialize strategy, orm
      super
    end      
    
    def strategy_module
      @strategy_module ||= orm_strategy_module || generic_strategy_module        
    end  

    protected

    def orm_strategy_module
      @orm_strategy_module ||= find_first_module("#{orm_namespace}::Strategy::#{strategy_class}", "#{namespace}::Strategy::#{base_class}")
    end

    def generic_strategy_module strategy_name, options
      @generic_module ||= find_first_module("#{namespace}::Strategy::#{strategy_class}", "#{namespace}::Strategy::#{base_class}")
    end
  end
end
