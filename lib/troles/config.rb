module Troles
  class Config < Behave::Config
    autoload_modules :ValidRoles, :StaticRoles

    def self.sub_modules
      [:valid_roles, :static_roles, :schema]
    end

    def initialize subject_class, options = {}
      super
    end

    alias_method :role_field, :main_field
    alias_method :role_field=, :main_field=
    alias_method :default_role_field, :default_main_field


    # get the default name of the main field
    # for roles, it depends on the singularity (one or many) of the strategy
    # see (#singularity)
    def default_main_field
      @default_main_field ||= (singularity == :many) ? :troles : :trole
    end

    # get the singularity (one or many) of the strategy
    def singularity
      @singularity ||= (strategy =~ /_many$/) ? :many : :one
    end


    def auto_config?(name)
      super
    end

    def configure_models
      super
    end

    def generic?
      super
    end
  end
end
