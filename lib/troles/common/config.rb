module Troles::Common
  class Config
    attr_accessor :role_model, :role_field, :generic, :clazz, :singularity, :strategy, :valid_roles
    
    def initialize clazz, options = {}
      @clazz = clazz 

      # set instance var for each pait in options
      apply_options! options
    end

    def apply_options! options = {}
      options.each_pair do |key, value|
        instance_variable_set("@#{key}", value) if self.respond_to?(:"#{key}")
      end      
    end

    def configure!
      configure_role_field      
    end

    # Sets the role model to use
    # allows different role subject classes (fx User Accounts) to have different role schemas
    # @param [Class] the model class
    def role_model= model_class
      @role_model = model_class and return if model_class.kind_of?(Class)
      raise "The role model must be a Class, was: #{model_class}"
    end

    # Gets the role model to be used
    # see (#role_model=)
    # @return [Class] the model class (defaults to Role)
    def role_model
      return @role_model if @role_model && defined? @role_model
      return Role if defined? Role
      raise "Troles could not figure out what Role model to use, please define a class Role or set the #role_model class method to point to a model of your choice!"
    end

    def role_field            
      return nil if !singularity && !@role_field
      @role_field ||= begin
        singularity == :many ? :troles : :trole
      end
    end 
    
    def role_field= field_name
      name = field_name.to_s.alpha_numeric.to_sym
      raise ArgumentException, "Not a valid field name: #{field_name}" if !name || name.empty? 
      @role_field ||= name
    end     

    def valid_roles= *roles
      @valid_roles ||= roles.flatten.map{|r| r.to_s.alpha_numeric}.map(&:to_sym).uniq
    end

    def configure_role_field options = {}
      clazz.send(:attr_accessor, role_field) if generic? # create troles accessor      
    end       
        
    def generic?
      @generic.nil? ? true : @generic
    end

    protected

    def clazz_name
      clazz.to_s
    end

    def clazz_key
      make_key clazz_name
    end

    def role_model_class_name
      role_model.to_s
    end
    
    def role_model_key
      make_key role_model_class_name
    end
    
    def make_key name
      name.gsub(/::/, '__').underscore      
    end
  end
end