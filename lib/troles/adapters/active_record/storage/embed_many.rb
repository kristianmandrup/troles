# Could use the AR serializer feature, to save the embedded roles as YAML
module Troles::Adapters::ActiveRecord::Storage
  class StringMany < Troles::Storage::StringMany
    def initialize role_subject
      super
    end
  end
end