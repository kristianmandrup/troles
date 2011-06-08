module Trole
  class Config < Troles::Common::Config    
    def initialize subject_class, options = {}
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