module Trole
  class Config < Troles::Common::Config  
    
    def initialize clazz, options = {}
      super
    end
    
    # more likely, strategy should be part of configuration options directly when Config object is created!
    def configure_role_field options = {}  
      strategy = options[:strategy] || strategy
      configure_field strategy
      configure_relation strategy
    end         

    def configure_relation strategy
      case strategy
      when :ref_one
        clazz.send(:has_one, role_model_key, :class_name => role_model_class_name)
        role_model.send(:belongs_to, clazz_key, :class_name => clazz_name)
      when :embed_one
        clazz.send(:embeds_one, role_model_key, :class_name => role_model_class_name)      
      end
    end
    
    def configure_field strategy
      type = case strategy
      when :bit_one
        Boolean
      when :string_one
       String
      end
      clazz.send(:field, role_field, type) if type      
    end
  end
end