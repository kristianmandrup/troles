require 'troles/common'

module Troles
  autoload_modules :Config, :Common, :Api, :Operations, :Strategy, :Storage, :Macros, :Adapters
end

Module.send :include, Troles::Common::Macros
