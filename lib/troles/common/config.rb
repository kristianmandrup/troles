module Troles::Common
  class Config
    attr_accessor :role_model, :role_field, :generic
    
    def initialize options = {}
      # for each instance var set it
    end
    
    def generic?
      @generic || true
    end
  end
end