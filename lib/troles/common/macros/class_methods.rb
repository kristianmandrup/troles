module Troles  
  module Macros
    module ClassMethods
      def set_options! strategy_name, options = {}
        options[:strategy] = strategy_name
        options[:singularity] = extract_singularity(options)
      end      

      # Try each of these!
      # TODO: Refactor cleanup and DRY!
      def strategy_module strategy_name, options = {}        
        ns = full_namespace(strategy_name, options)          
        base_class = base_name(strategy_name) 
        
        mods_found = ["#{ns}::Strategy::#{strategy_name.to_s.camelize}", "#{ns}::Strategy::#{base_class}"].select do |full_name|
          try_module(full_name)
        end
        return mods_found.first.constantize if !mods_found.empty?

        # use generic if no ORM specific strategy found!
        ns = namespace(strategy_name, options)
        mods_found = ["#{ns}::Strategy::#{strategy_name.to_s.camelize}", "#{ns}::Strategy::#{base_class}"].select do |full_name|
          try_module(full_name)
        end        
        return mods_found.first.constantize if !mods_found.empty?

        raise "No matching strategy module found for strategy: #{strategy_name} and options: #{options}"
      end  

      def try_module full_name
        begin
          full_name.constantize
          true
        rescue
          puts "module #{full_name} not found!"
          false
        end
      end

      def base_name strategy_name
        "Base#{singularity(strategy_name).to_s.camelize}"
      end

      def singularity strategy_name
        (strategy_name =~ /_many$/) ? :many : :one
      end
      
      def namespace strategy_name, options = {}
        first = singularity(strategy_name) == :many ? 'Troles' : 'Trole'      
      end

      def full_namespace strategy_name, options = {}
        first = namespace strategy_name, options
        orm = options[:orm] || Troles::Config.default_orm
        first << "::#{orm.to_s.camelize}" if options[:orm]
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

      def define_hooks clazz, options = {}
        storage_class = get_storage_class(options)
        clazz.send :define_method, :storage do 
          @storage ||= storage_class
        end

        config_class = get_config_class(options) 
        clazz.meta_def :troles_config do
          @troles_config ||= config_class.new self
        end
      end

      protected

      def get_storage_class options = {}
        strategy = options[:strategy]
        begin
          ns = full_namespace(strategy, options)
          "#{ns}::Storage::#{strategy.to_s.camelize}".constantize
        rescue
          # use generic if no ORM specific strategy found!
          ns = namespace(strategy, options)
          "#{ns}::Storage::#{strategy.to_s.camelize}".constantize
        end        
      end

      def get_config_class options = {}
        strategy = options[:strategy]
        begin
          ns = full_namespace(strategy, options)
          "#{ns}::Config".constantize
        rescue
          # use generic if no ORM specific strategy found!
          ns = namespace(strategy, options)
          "#{ns}::Config".constantize
        end        
      end

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
  end
end