module Troles::Common
  module Api
    autoload_modules :Core, :Cache, :Config, :Event, :Read, :Write, :Validation, :ClassMethods
    extend ClassMethods
  end
end
