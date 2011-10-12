#
# @author Kristian Mandrup
#
# Container for Single role Storages
#
module Trole
  module Storage
    autoload_modules :BaseOne, :BitOne, :EmbedOne, :RefOne, :StringOne
  end
end