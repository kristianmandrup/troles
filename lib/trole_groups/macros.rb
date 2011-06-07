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

puts "TroleGroups macros enabled!"

module TroleGroups
  module Macros
    autoload :Configuration, 'trole_groups/macros/configuration'
    
    def trolegroups_strategy strategy, options = {}, &block
      configuration = Configuration.new self, strategy, options

      configuration.load_adapter
      # puts "strategy module: #{configuration.strategy_module}"
      send :include, configuration.strategy_module

      configuration.define_hooks
      configuration.apply_strategy_options!
      
      if strategy == :bit_one 
        trolegroups_config.valid_roles = [:user, :admin] # default binary roles 
      end
      
      yield trolegroups_config if block_given?
      trolegroups_config
    end     
  end  
end

Module.send :include, TroleGroups::Macros
