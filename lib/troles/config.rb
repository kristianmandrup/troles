module Troles
  class Config < Troles::Common::Config    
    def initialize clazz, options = {}
      super
    end

    def configure_role_field
      super
    end       
        
    def generic?
      super
    end
  end
end