# Base module for One strategy
module Trole
  module Strategy
    module BaseOne
      include Api 
      
      class << self
        def set_role role
          raise "Must be implemented by Strategy"
        end

        def clear!
          raise "Must be implemented by Strategy"
        end

        def persist_role_changes!
          # raise "Must be implemented by Strategy"
          puts "persisted!"
        end
      end      
    end
  end
end