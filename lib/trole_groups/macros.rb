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

# puts "TroleGroups macros enabled!"

module TroleGroups
  module Macros
    autoload_modules :Configuration
    
    def trolegroups_strategy strategy, options = {}, &block
      configuration = Configuration.new self, strategy, options

      configuration.load_adapter
      # puts "strategy module: #{configuration.strategy_module}" 
      begin
        self.send :include, configuration.strategy_module
      rescue
        puts "error loading strategy: #{configuration.strategy_module}"
      end

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

