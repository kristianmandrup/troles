# require 'troles'
require 'troles/common'

module Trole
  autoload_modules :Config, :Api, :Operations, :Strategy, :Storage, :Macros
end

Module.send :include, Trole::Macros
