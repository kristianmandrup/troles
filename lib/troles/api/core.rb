puts "Troles Core"

module Troles::Api
  module Core    
    module ClassMethods                  
      puts "Troles Core ClassMethods"      
      
      def role_field
        :troles
      end      
    end
  end
end