module TroleGroups
  module ActiveRecord
    autoload :Config,     'trole_groups/adapters/active_record/config'
    # autoload :Api,        'trole_groups/adapters/active_record/api'
    autoload :Storage,    'trole_groups/adapters/active_record/storage'
    autoload :Strategy,   'trole_groups/adapters/active_record/strategy'
  end
end