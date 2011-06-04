module Troles::Common
  class Config
    attr_accessor :role_model, :role_field, :generic, :clazz
    
    def initialize clazz, options = {}
      # for each instance var set it
      @clazz = clazz
    end

    def configure_role_field options = {}
      clazz.send(:attr_accessor, clazz.role_field) if generic? # create troles accessor      
    end       
        
    def generic?
      @generic.nil? ? true : @generic
    end
  end
end