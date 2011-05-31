module Trole
  module Strategy
    autoload :BaseOne,   'trole/strategy/base_one'
    autoload :BitOne,    'trole/strategy/bit_one'
    autoload :EmbedOne,  'trole/strategy/embed_one'
    autoload :RefOne,    'trole/strategy/ref_one'
    autoload :StringOne, 'trole/strategy/string_one'

    class GenericStorage
      attr_reader :api

      def initialize api
        @api = api
      end
      
      def valid_roles
        api.class.valid_roles
      end        

      def name
        :generic
      end
    end        
  end
end