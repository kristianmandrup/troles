module Troles::Mongoid::Storage
  class StringMany < Troles::Storage::StringMany
    def initialize role_subject
      super
    end
  end
end