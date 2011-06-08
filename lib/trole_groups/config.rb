module TroleGroups
  class Config        
    autoload :ValidRoleGroups,      'trole_groups/config/valid_role_groups'        
    autoload :Schema,               'trole_groups/config/schema'

    def self.sub_modules
      [:valid_role_groups, :schema] # , :static_roles, , 
    end
    
    sub_modules.each do |name|
      begin
        self.send :include, "TroleGroups::Config::#{name.to_s.camelize}".constantize
      rescue Error => e 
        puts "include sub-module #{name}, error: #{e}"
      end
    end

    attr_accessor :subject_class, :strategy, :log_on, :generic, :auto_relations
    attr_writer   :orm

    def initialize subject_class, options = {}
      @subject_class = subject_class
      # set instance var for each pair in options
      apply_options! options
    end

    def apply_options! options = {}
      options.each_pair do |key, value| 
        send("#{key}=", value) if self.respond_to?(:"#{key}")
      end      
    end

    def configure! options = {}
      apply_options! options
      configure_models if auto_config?(:models)
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

      def auto_config
        auto_config_setings
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

    def auto_config
      auto_config_setings 
    end 

    def auto_config? name
      return auto_config_setings[name] if !auto_config_setings[name].nil?
      Troles::Config.auto_config?(name)
    end


    def auto_config_setings
      @auto_config_setings ||= {}
    end
    
    def role_field
      @role_field ||= begin
        default_role_field
      end
    end
    alias_method :rolegroup_field, :role_field

    def role_field= field_name
      name = field_name.to_s.alpha_numeric.to_sym
      raise ArgumentException, "Not a valid role field name: #{field_name}"  if !valid_field_name?(name)
      @role_field ||= name
    end
    alias_method :rolegroup_field=, :role_field=

    def default_role_field
      :trole_groups
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
