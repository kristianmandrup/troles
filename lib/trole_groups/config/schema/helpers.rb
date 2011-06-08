module TroleGroups
  class Config
    module Schema
      module Helpers
        def self.included(base)
          # base.send :include, Troles::Common::Config::Schema::Helpers
        end
      end
    end
  end
end
