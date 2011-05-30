module Trole
  module EventManager
    class << self
      attr_accessor :subscribers
      
      def publish_change event, options
        # from = options[:from]
        subscribers.each do |subscriber|
          subscriber.notify(event)
        end
      end
      
      def add_subscribers subscribers
        self.subscribers << subscribers
      end

      def remove_subscribers subscribers
        self.subscribers - subscribers
      end
    end
  end
end