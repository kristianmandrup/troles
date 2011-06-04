module Troles::Mongoid
  module Strategy
    # autoload :BaseMany,   'troles/storage/base_many'
    # autoload :BitMany,    'troles/storage/bit_many'
    # autoload :EmbedMany,  'troles/storage/embed_many'
    # autoload :RefMany,    'troles/storage/ref_many'
    autoload :StringMany,   'troles/adapters/mongoid/strategy/string_many'    
  end
end