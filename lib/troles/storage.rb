# @author Kristian Mandrup
#
# @note all storage modules potentially operate directly on values in the data store
#
module Troles
  module Storage
    autoload_modules :BaseMany, :BitMany, :EmbedMany, :RefMany, :JoinRefMany, :StringMany
  end
end