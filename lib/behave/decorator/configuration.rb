module Behave  
  class Decorator    
    class Configuration
            
      attr_reader :strategy, :orm, :auto_load, :options, :subject_class, :behavior
      
      def initialize subject_class, strategy, options = {}
        @subject_class = subject_class
        @strategy = strategy
        @orm = options[:orm] || Behave::Config.default_orm
        @auto_load = options[:auto_load]

        options[:strategy] = strategy
        @options = options
      end

      # this is used to load a specific ORM adapter, such as for Active Record or Mongoid etc. 
      def load_adapter
        return false if !auto_load?

        path = "#{namespace}/adapters/#{orm.to_s.underscore}"
        begin
          require path
        rescue
          raise "Adapter for :#{orm} could not be found at: #{path}"
        end
      end

      # applying options means to set attributes on the config object according to the key/values
      # of the options hash
      def apply_strategy_options!
        behavior.config.apply_options! options
      end      

      # defines hook methods on the behavior
      def define_hooks
        setup_storage if storage?
        setup_config if config?
      end

      # setup storage hook method on behavior to point to storage class
      def setup_storage
        storage_class = storage_loader.storage_class
        behavior.send :define_method, :storage do 
          @storage ||= storage_class
        end
      end

      # setup config hook method on behavior to point to config class
      def setup_config
        config_class = config_loader.config_class
        puts "config_class: #{config_class}" if Behave::Config.log_on
        behavior.singleton_class.class_eval %{
          def config
            @config ||= #{config_class}.new #{subject_class}, #{options.inspect}
          end
        }
      end

      def strategy_module
        strategy_loader.strategy_module
      end

      protected

      def storage?
        options[:storage]
      end

      def config?
        options[:config]
      end

      def namespace
        behavior.name
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
    end
  end
end