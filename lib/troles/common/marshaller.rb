# 
# @author Kristian Mandrup
#
# Marshallers can be used by Storages to handle conversion from 
# between a role list of symbols and the data format stored in the datastore
# One example is the Bitmask marshaller, which converts between an Integer and a role list
# One could imagine other custom marshallers, such as using encrypted strings etc.
# 
module Troles
  module Marshaller
    autoload :Generic,   'troles/marshaller/generic'
    autoload :Bitmask,   'troles/marshaller/bitmask'
  end
end