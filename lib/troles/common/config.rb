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

    attr_accessor :clazz, :strategy, :orm 

    attr_reader   :singularity
    attr_writer   :generic
    
    def initialize clazz, options = {}
      @clazz = clazz 

      # set instance var for each pair in options
      apply_options! options
    end

    def apply_options! options = {}
      options.each_pair do |key, value|
        instance_variable_set("@#{key}", value) if self.respond_to?(:"#{key}")
      end      
    end

    def singularity= value
      raise ArgumentError, "Must be :single or :many" if ![:single, :many].include?(value)      
      @singularity ||= value
    end

    def configure! options = {}
      apply_options! options
      configure_role_field
    end
            
    def generic?
      @generic.nil? ? false : @generic
    end
  end
end