module Troles::Common::Macros
  class Configuration  
    class StrategyLoader < BaseLoader

      def initialize strategy, orm
        super
      end      
      
      def strategy_module
        @strategy_module ||= orm_strategy_module || generic_strategy_module        
      end  

      protected

      def orm_strategy_module
        @orm_strategy_module ||= begin         
          mods_found = ["#{orm_namespace}::Strategy::#{strategy.to_s.camelize}", "#{namespace}::Strategy::#{base_class}"].select do |full_name|
            try_module(full_name)
          end
          !mods_found.empty? ? mods_found.first.constantize : nil
        end
      end

      def generic_strategy_module strategy_name, options
        @generic_module ||= begin
          base_class = base_name(strategy_name) 
  
          # use generic if no ORM specific strategy found!
          ns = namespace(strategy_name, options)
          mods_found = ["#{namespace}::Strategy::#{strategy.to_s.camelize}", "#{namespace}::Strategy::#{base_class}"].select do |full_name|
            try_module(full_name)
          end        
          !mods_found.empty? ? mods_found.first.constantize : nil
        end
      end
    end
  end
end