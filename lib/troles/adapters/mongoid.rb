module Troles
  module Mongoid
    autoload :Config,     'troles/adapters/mongoid/config'
    autoload :Api,        'troles/adapters/mongoid/api'
    autoload :Storage,    'troles/adapters/mongoid/storage'
    autoload :Strategy,   'troles/adapters/mongoid/strategy'
  end
end