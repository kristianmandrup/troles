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

puts "Troles macros enabled!"

module Troles  
  module Macros
    autoload :Configuration, 'troles/common/macros/configuration'
    
    def troles_strategy strategy, options = {}, &block
      configuration = Configuration.new self, strategy, options

      configuration.load_adapter
      puts "strategy module: #{configuration.strategy_module}"
      send :include, configuration.strategy_module

      configuration.apply_strategy_options!
      configuration.define_hooks
      
      if strategy == :bit_one 
        troles_config.valid_roles = [:user, :admin] # default binary roles 
      end
      
      yield troles_config if block_given?
      troles_config
    end     
  end  
end

Module.send :include, Troles::Macros
