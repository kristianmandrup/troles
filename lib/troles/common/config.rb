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

    attr_accessor :clazz, :strategy
    attr_writer   :generic, :orm
    
    def initialize clazz, options = {}
      @clazz = clazz
      # set instance var for each pair in options
      apply_options! options
    end

    class << self
      attr_reader :default_orm, :auto_load
      
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

    def apply_options! options = {}
      options.each_pair do |key, value| 
        send("#{key}=", value) if self.respond_to?(:"#{key}")
      end      
    end

    def singularity
      @singularity ||= (strategy =~ /_many$/) ? :many : :one
    end

    # def singularity= value
    #   raise ArgumentError, "Must be :many or :one" if ![:one, :many].include?(value)      
    #   @singularity ||= value
    # end

    def configure! options = {}
      apply_options! options
      configure_role_field
    end
            
    def generic?
      @generic.nil? ? false : @generic
    end
  end
end