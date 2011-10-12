# 
# @author Kristian Mandrup
#
# Many roles Api to be included directly on the role subject class (fx User or User Account)
#
module Troles
  module Api
    autoload_modules :Core, :Config, :Cache, :Event, :Read, :Store, :Validation, :Write, :ClassMethods
    extend ClassMethods
  end
end