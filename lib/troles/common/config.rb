module Troles::Common
  class Config
    attr_accessor :role_model, :role_field, :generic, :clazz
    
    def initialize clazz, options = {}
      @clazz = clazz 

      # set instance var for each pait in options
      options.each_pair do |key, value|
        instance_variable_set("@#{key}", value) if self.respond_to?(:"#{key}")
      end
    end

    def configure_role_field options = {}
      clazz.send(:attr_accessor, clazz.role_field) if generic? # create troles accessor      
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