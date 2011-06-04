module Troles::ActiveRecord
  module Storage
    # autoload :BaseMany,   'troles/storage/base_many'
    # autoload :BitMany,    'troles/storage/bit_many'
    # autoload :EmbedMany,  'troles/storage/embed_many'
    # autoload :RefMany,    'troles/storage/ref_many'
    autoload :StringMany, 'troles/adapters/active_record/storage/string_many'    
  end
end