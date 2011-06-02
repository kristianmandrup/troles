#
# @author Kristian Mandrup
#
# Container for Single role Strategies
#
module Trole
  module Strategy
    autoload :BaseOne,   'trole/strategy/base_one'
    autoload :BitOne,    'trole/strategy/bit_one'
    autoload :EmbedOne,  'trole/strategy/embed_one'
    autoload :RefOne,    'trole/strategy/ref_one'
    autoload :StringOne, 'trole/strategy/string_one'
  end
end