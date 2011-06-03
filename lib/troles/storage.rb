# @author Kristian Mandrup
#
# @note all storage modules potentially operate directly on values in the data store
#
module Troles
  module Storage
    autoload :BaseMany,   'troles/storage/base_many'
    autoload :BitMany,    'troles/storage/bit_many'
    autoload :EmbedMany,  'troles/storage/embed_many'
    autoload :RefMany,    'troles/storage/ref_many'
    autoload :StringMany, 'troles/storage/string_many'    
  end
end