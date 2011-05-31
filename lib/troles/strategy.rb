module Troles
  module Strategy
    autoload :BaseMany,   'troles/strategy/base_many'
    autoload :BitMany,    'troles/strategy/bit_many'
    autoload :EmbedMany,  'troles/strategy/embed_many'
    autoload :RefMany,    'troles/strategy/ref_many'
    autoload :StringMany, 'troles/strategy/string_many'
        
    class GenericStorage < Trole::Strategy::GenericStorage
      def initialize api
        super
      end      
    end        
  end
end