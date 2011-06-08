module TroleGroups  
  module Macros    
    class Configuration
      autoload :BaseLoader,     'trole_groups/macros/configuration/base_loader'
      autoload :ConfigLoader,   'trole_groups/macros/configuration/config_loader'
      autoload :StrategyLoader, 'trole_groups/macros/configuration/strategy_loader'
      autoload :StorageLoader,  'trole_groups/macros/configuration/storage_loader'      
      
      attr_reader :strategy, :singularity, :orm, :auto_load, :options, :subject_class
      
      def initialize subject_class, strategy, options = {}
        @subject_class = subject_class
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

        path = "#{namespace}/adapters/#{orm.to_s.underscore}"
        begin
          require path
        rescue
          raise "Adapter for :#{orm} could not be found at: #{path}"
        end
      end
  
      def apply_strategy_options!        
        trolegroups_config.apply_options! options

        # StrategyOptions.new(subject_class)
        # extract_macros(options).each{|m| apply_macro m}
      end      

      def trolegroups_config
        subject_class.trolegroups_config
      end

      def define_hooks
        storage_class = storage_loader.storage_class
        # puts "storage_class: #{storage_class}"
        subject_class.send :define_method, :group_storage do 
          @group_storage ||= storage_class
        end
        
        config_class = config_loader.config_class
        puts "config_class: #{config_class}" if Troles::Config.log_on
        subject_class.singleton_class.class_eval %{
          def trolegroups_config
            @trolegroups_config ||= #{config_class}.new #{subject_class}, #{options.inspect}
          end
        }
      end

      protected

      def namespace
        'trole_groups'
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