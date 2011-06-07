module Troles::Common
  class Config
    autoload :ValidRoles,     'troles/common/config/valid_roles'        
    autoload :StaticRoles,    'troles/common/config/static_roles'
    autoload :Schema,         'troles/common/config/schema'
    autoload :SchemaHelpers,  'troles/common/config/schema_helpers'

    def self.sub_modules
      [:valid_roles, :static_roles, :schema]
    end
    
    sub_modules.each do |name|    
      send :include, "Troles::Common::Config::#{name.to_s.camelize}".constantize
    end

    attr_accessor :clazz, :strategy, :log_on, :generic, :auto_relations
    attr_writer   :orm
    
    def initialize clazz, options = {}
      @clazz = clazz
      # set instance var for each pair in options
      apply_options! options
    end

    class << self
      attr_reader :default_orm, :auto_load
      attr_accessor :log_on

      def log_on?
        log_on || false
      end
      
      def default_orm= orm
        @default_orm ||= orm
      end
      
      def auto_load= mode
        raise "Autoload must be set to true or false" if ![true, false].include? mode
        @auto_load = mode
      end

      def auto_load?
        @auto_load
      end      

      def auto_config name
        auto_config_setings[name]
      end 
      
      def auto_config? name
        auto_config_setings[name]
      end
      
      protected


      def auto_config_setings
        @auto_config_setings ||= auto_config_defaults
      end

      # default auto_config settings
      def auto_config_defaults
        {:models => true, :relations => true, :fields => true}
      end      
    end

    def log_on?
      log_on || Troles::Config.log_on
    end

    def auto_config name
      auto_config_setings[name] 
    end 
    
    def auto_config? name
      return auto_config_setings[name] if auto_config_setings[name]
      Troles::Config.auto_config?(name)
    end

    def apply_options! options = {}
      options.each_pair do |key, value| 
        send("#{key}=", value) if self.respond_to?(:"#{key}")
      end      
    end

    def configure! options = {}
      apply_options! options
      configure_role_field if auto_config?(:models)
    end
    
    # protected

    def auto_config_setings
      @auto_config_setings ||= {}
    end

    def role_field
      @role_field ||= begin
        default_role_field
      end
    end

    def role_field= field_name
      name = field_name.to_s.alpha_numeric.to_sym
      raise ArgumentException, "Not a valid role field name: #{field_name}"  if !valid_field_name?(name)
      @role_field ||= name
    end

    def default_role_field
      singularity == :many ? :troles : :trole
    end

    def orm
      @orm || self.class.default_orm
    end

    def singularity
      @singularity ||= (strategy =~ /_many$/) ? :many : :one
    end

    # def singularity= value
    #   raise ArgumentError, "Must be :many or :one" if ![:one, :many].include?(value)      
    #   @singularity ||= value
    # end
            
    def generic?
      return true if orm.nil?
      @generic.nil? ? false : @generic
    end
  end
end