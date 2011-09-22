require 'sweetloader'
require 'troles/common'
require 'troles/macros'

module Troles
  autoload_modules :Config, :Common, :Api, :Operations, :Strategy, :Storage
end
