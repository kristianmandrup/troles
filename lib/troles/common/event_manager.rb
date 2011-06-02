# 
# @author Kristian Mandrup
#
# Handles event handlinm/publication for when the roles of a role subject change
# This is currently a singleton (class methods only) by design
#
module Troles
  module EventManager
    def self.included(base)
      base.extend ClassMethods
    end

    # TODO:
    module ClassMethods
      attr_accessor :subscribers

      def subscribers
        @subscribers ||= []
      end
      
      def publish_change event, options
        # from = options[:from]
        subscribers.each do |subscriber|
          subscriber.notify(event) if subscriber.respond_to?(:notify)
        end
        true
      end
      
      def add_subscribers subscribers
        self.subscribers << subscribers
      end

      def remove_subscribers subscribers
        self.subscribers - subscribers
      end      
    end
       
    extend ClassMethods
  end
end