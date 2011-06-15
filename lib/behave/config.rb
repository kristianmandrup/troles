module Behave
  class Config
    autoload :Schema,         'behave/config/schema'
    autoload :SchemaHelpers,  'behave/config/schema_helpers'
    autoload :ClassMethods,   'behave/config/class_methods'

    attr_accessor :subject_class, :strategy, :log_on, :generic
    attr_writer   :orm

    # configure Config object with subject class and various options
    def initialize subject_class, options = {}
      raise ArgumentError, "The first argument must be the Class which is the subject of the behavior" unless subject_class.is_a?(Class)
      @subject_class = subject_class

      apply_options! options
    end

    extend ClassMethods

    # Call setter for each key/value pair
    def apply_options! options = {}
      options.each_pair do |key, value| 
        send("#{key}=", value) if self.respond_to?(:"#{key}=")
      end      
    end

    # Configure subject with behavior
    # First apply any remaining options needed
    # Then configure models if configured to do do
    def configure! options = {}
      apply_options! options
      configure_models if auto_config?(:models)
    end

    # is logging on?
    def log_on?
      log_on || Behave::Config.log_on
    end

    # get the auto configuration settings hash
    def auto_config
      @auto_config ||= {}
    end 

    # is a certain type of auto configuration enabled?
    def auto_config? name
      return auto_config[name] if !auto_config[name].nil?      
    end

    # Get the main field name that is used for the behavior added, fx :troles for roles behavior
    def main_field
      @main_field ||= begin
        default_main_field
      end
    end

    # Set the main field of the behavior
    def main_field= field_name
      name = field_name.to_s.alpha_numeric.to_sym
      raise ArgumentException, "Not a valid field name: #{field_name}"  if !valid_field_name?(name)
      @main_field ||= name
    end

    # get the orm name
    def orm
      @orm || self.class.default_orm
    end

    # is it a generic strategy/orm ?
    def generic?
      return true if orm.nil? || orm == :generic
      @generic.nil? ? false : @generic
    end
  end
end