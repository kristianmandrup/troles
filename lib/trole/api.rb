# 
# @author Kristian Mandrup
#
# Single role Api to be included directly on the role subject class (fx User or User Account)
#
module Trole
  module Api
    autoload_modules :Core, :Config, :Cache, :Event, :Read, :Write, :Validation, :ClassMethods
    extend ClassMethods    
  end
end