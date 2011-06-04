puts "common api"

module Troles::Common::Api
  module Config
    module ClassMethods
      def troles_config
        @troles_config ||= Troles::Common::Config.new self
      end      
    end
  end
end
