module Troles::Common
  class Config
    attr_accessor :role_model, :join_model, :role_field, :generic, :clazz, :singularity, :strategy, :orm 
    #:valid_roles
    
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

    def configure! options = {}
      apply_options! options
      configure_role_field
    end

    def configure_role_field
      configure_field
      configure_relation
    end         

    # Adapter should customize this as needed 
    def configure_field
    end

    # Adapter should customize this as needed 
    def configure_relation
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
      vrs = roles.flatten.map{|r| r.to_s.alpha_numeric}.map(&:to_sym).uniq
      raise ArgumentError, "The role names you want to be valid are not valid role names. Must be alphanumeric, was: #{roles.flatten}" if vrs.empty?
      @valid_roles ||= vrs
    end

    def valid_roles
      raise "No valid roles defined" if !@valid_roles || @valid_roles.empty?
      @valid_roles      
    end

    def configure_role_field options = {}
      clazz.send(:attr_accessor, role_field) if generic? || orm == nil # create troles accessor      
    end       
        
    def generic?
      @generic.nil? ? false : @generic
    end

    protected

    # TODO: Needs extraction into helper module!

    def belong_to from, to
      make_relationship :belongs_to, from, to
    end
    
    def has_many_for from, to, through = nil
      make_relationship :has_many, from, to, through
    end
    
    def make_relationship type, from, to, through
      model_key = send "#{from}_key"
      class_name = send "#{to}_class_name"
      options = {:class_name => class_name}
      options.merge!(through) if through
      from.send(type, model_key, options)
    end

    def user_class_name
      clazz.to_s
    end

    def user_key
      make_key user_class_name
    end

    def join_class_name
      join_model.to_s
    end

    def join_key
      make_key join_class_name
    end

    def role_class_name
      role_model.to_s
    end
    
    def role_key
      make_key role_class_name
    end
    
    def make_key name
      name.gsub(/::/, '__').underscore      
    end
  end
end