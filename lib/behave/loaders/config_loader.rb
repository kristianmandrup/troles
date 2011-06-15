module Behave
  class ConfigLoader < BaseLoader
          
    def initialize strategy, orm
      super
    end

    def config_class
      @config_class ||= find_first_class("#{orm_namespace}::Config", "#{namespace}::Config")
    end
  end
end

