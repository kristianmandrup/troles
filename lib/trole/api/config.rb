# 
# @author Kristian Mandrup
#
# Single role Config Api
#
module Trole::Api
  module Config
    def troles_config
      @troles_config ||= Trole::Config.new self
    end          
  end  
end