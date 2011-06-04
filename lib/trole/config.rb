module Trole
  class Config < Troles::Common::Config    
    def initialize clazz, options = {}
      super
    end

    def configure_role_field options = {}
      super
    end       
        
    def generic?
      super
    end
  end
end