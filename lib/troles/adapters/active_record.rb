module Troles::Adapters
  module ActiveRecord
    autoload_modules :Config, :Storage, :Strategy
  end
end