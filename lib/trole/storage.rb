module Trole
  module Storage
    autoload :Generic,    'trole/storage/generic'
    autoload :BitMany,    'trole/storage/bit_many'
    autoload :EmbedMany,  'trole/storage/embed_many'
    autoload :RefMany,    'trole/storage/ref_many'
    autoload :StringMany, 'trole/storage/string_many'        
  end
end