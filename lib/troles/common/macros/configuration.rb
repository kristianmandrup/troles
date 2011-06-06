module Troles  
  module Macros    
    class Configuration
      autoload :BaseLoader,     'troles/common/macros/configuration/base_loader'
      autoload :ConfigLoader,   'troles/common/macros/configuration/config_loader'
      autoload :StrategyLoader, 'troles/common/macros/configuration/strategy_loader'
      autoload :StorageLoader,  'troles/common/macros/configuration/storage_loader'      
      
      attr_reader :strategy, :singularity, :orm, :auto_load, :options, :role_subject_class
      
      def initialize role_subject_class, strategy, options = {}
        @role_subject_class = role_subject_class
        @strategy = strategy
        @orm = options[:orm] || Troles::Config.default_orm
        @auto_load = options[:auto_load] || Troles::Config.auto_load?
        options[:strategy] = strategy
        @options = options
      end

      def strategy_module
        strategy_loader.strategy_module
      end
            
      def load_adapter
        return false if !auto_load?

        path = "troles/adapters/#{orm.to_s.underscore}"
        begin
          require path
        rescue
          raise "Adapter for :#{orm} could not be found at: #{path}"
        end
      end
  
      def apply_strategy_options!
        role_subject_class.troles_config.apply_options! options

        # StrategyOptions.new(clazz)
        # extract_macros(options).each{|m| apply_macro m}
      end      

      def define_hooks
        storage_class = storage_loader.storage_class
        role_subject_class.send :define_method, :storage do 
          @storage ||= storage_class
        end
        
        config_class = config_loader.config_class
        role_subject_class.singleton_class.class_eval %{
          def troles_config
            @troles_config ||= #{config_class}.new #{role_subject_class}, #{options.inspect}
          end
        }
      end

      protected

      def singularity
        @singularity ||= (strategy =~ /_many$/) ? :many : :one
      end

      def storage_loader
        @storage_loader ||= StorageLoader.new strategy, orm
      end

      def config_loader
        @config_loader ||= ConfigLoader.new strategy, orm
      end

      def strategy_loader
        @strategy_loader ||= StrategyLoader.new strategy, orm
      end


      def auto_load?
        (auto_load && orm) || false
      end
  
      # def extract_macros options = {}
      #   [:static_role].select {|o| options[o]}
      # end
    end
  end
end