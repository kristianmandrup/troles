require 'troles/common'

module TroleGroups  
  autoload_modules :Config, :Api, :Operations, :Strategy, :Storage, :Macros
end

Module.send :include, TroleGroups::Macros