#
# @author Kristian Mandrup
#
# Container for Single role Storages
#
module Trole
  module Storage
    autoload :BaseOne,   'trole/storage/base_one'
    autoload :BitOne,    'trole/storage/bit_one'
    autoload :EmbedOne,  'trole/storage/embed_one'
    autoload :RefOne,    'trole/storage/ref_one'
    autoload :StringOne, 'trole/storage/string_one'        
  end
end