module Troles::Mongoid::Api
  module Config
    def troles_config
      @troles_config ||= Troles::Config.new self, :generic => false
    end      
  end  
end
