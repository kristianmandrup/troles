module Troles
  module ActiveRecord
    autoload :Config,     'troles/adapters/active_record/config'
    autoload :Api,        'troles/adapters/active_record/api'
    autoload :Storage,    'troles/adapters/active_record/storage'
    autoload :Strategy,   'troles/adapters/active_record/strategy'
  end
end