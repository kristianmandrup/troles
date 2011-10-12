module Trole
  module Api
    #
    # When the Trole::Api is included by the Role Subject class (fx a User Account)
    # first include methods from Troles Common API      
    # then include Trole API on top
    #
    # @param [Class] the role subject class (fx User or UserAccount)
    #
    module ClassMethods
      def included(base)
        base.send :include, Troles::Common::Api
        self.extend Troles::Common::Api::ClassMethods # draws in the #apis method from Common Api

        apis.each do |api|
          begin
            base.send :include, "Trole::Api::#{api.to_s.camelize}".constantize
            base.extend "Trole::Api::#{api.to_s.camelize}::ClassMethods".constantize            
            # base.include_and_extend :"#{api.to_s.camelize}"
          rescue
          end
        end
      end
    end
  end
end