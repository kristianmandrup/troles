require 'troles/common'
require 'troles/macros'

module TroleGroups  
  autoload :Config,         'trole_groups/config'
  autoload :Api,            'trole_groups/api'
  autoload :Operations,     'trole_groups/operations'
  autoload :Strategy,       'trole_groups/strategy'
  autoload :Storage,        'trole_groups/storage'
end