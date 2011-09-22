#
# @author Kristian Mandrup
#
# The Common (Generic) Roles API, functionality to be reused by both Trole and Troles
#
require 'troles/common/dependencies'

module Troles
  module Common
    autoload_modules :Api, :Config, :Operations, :Marshaller, :Storage, :EventManager
  end
end
