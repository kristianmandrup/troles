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
    autoload :Configuration, 'behave/macros/configuration'
    
    def behave_as strategy, options = {}, &block
      configuration = Configuration.new self, strategy, options

      configuration.load_adapter
      puts "strategy module: #{configuration.strategy_module}"
      puts configuration.strategy_module.methods.grep /store/ 
      
      send :include, configuration.strategy_module

      configuration.define_hooks
      configuration.apply_strategy_options!

      if strategy == :bit_one 
        behavior_config.valid_roles = [:user, :admin] # default binary roles 
      end
      
      yield behavior_config if block_given?
      behavior_config
    end     
  end  
end

Module.send :include, Behave::Macros
