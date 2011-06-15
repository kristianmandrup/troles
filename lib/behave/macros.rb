# 
# @author Kristian Mandrup
#
# Macros that can be used directly on the role subject class 
# These methods are added to the ruby core 'Module' module
#
# Usage:
#   class User
#     troles_strategy :bit_many
#

module Behave  
  module Macros
    def behave!
      self.singleton_class.class_eval %{
        def behaviors
          @behaviors ||= {}
        end
      }
    end
    
    def behavior name
      behave! unless respond_to? :behaviors
      raise ArgumentError, "Behavior '#{name}' already available" if has_behavior?(name)
      behaviors[name.to_sym]
    end
    
    def has_behavior?
      return false unless respond_to? :behaviors
      behaviors.keys.include? name.to_sym
    end
  end  
end

Module.send :include, Behave::Macros
