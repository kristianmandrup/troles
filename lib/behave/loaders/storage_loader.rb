module Behave
  class StorageLoader < BaseLoader

    def initialize strategy, orm
      super
    end

    def storage_class
      @storage_class ||= find_first_class("#{orm_namespace}::Storage::#{strategy_class}", "#{namespace}::Storage::#{strategy_class}")
    end
  end
end


