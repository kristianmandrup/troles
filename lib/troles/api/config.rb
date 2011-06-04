# 
# @author Kristian Mandrup
#
# Many roles Config Api
#
module Troles::Api
  module Config
    def troles_config
      @troles_config ||= Troles::Config.new self
    end      
  end  
end
