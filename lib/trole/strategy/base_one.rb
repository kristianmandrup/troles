# Base module for One strategy
module Trole
  module Strategy
    module BaseOne
      def self.included(base)
        base.send :include, Trole::Api
        base.send :attr_accessor, base.role_field
      end
      
      class << self
        def set_role role
          raise "Must be implemented by Strategy"
        end

        def clear!
          set_default_role!
        end

        def set_default_role!
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