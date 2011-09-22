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

module Troles::Common
  module Macros
    autoload_modules :Configuration
    # IMPORTANT
    # Should hook into Behave macros and just extend it with what is specific for troles config, 
    # should result in most of local /macros folder being generalised in behave macros

    # See 'Behavior decorator pattern.textile' for more...

    # def troles_strategy strategy, options = {}, &block
    #   configuration = Configuration.new self, strategy, options
    # 
    #   configuration.load_adapter
    #   puts "strategy module: #{configuration.strategy_module}"
    #   puts configuration.strategy_module.methods.grep /store/ 
    #   
    #   send :include, configuration.strategy_module
    # 
    #   configuration.define_hooks
    #   configuration.apply_strategy_options!
    # 
    #   if strategy == :bit_one 
    #     troles_config.valid_roles = [:user, :admin] # default binary roles 
    #   end
    #   
    #   yield troles_config if block_given?
    #   troles_config
    # end     
  end  
end

Module.send :include, Troles::Macros
