module Troles
  class Config < Troles::Common::Config  
    
    def initialize clazz, options = {}
      super
    end
    
    # more likely, strategy should be part of configuration options directly when Config object is created!
    def configure_role_field options = {}  
      strategy = options[:strategy] # || strategy TODO
      configure_field strategy
      configure_relation strategy
    end         

    def configure_relation strategy
      case strategy
      when :ref_many
        clazz.send(:has_many, role_model_key, :class_name => role_model_class_name)
        role_model.send(:belongs_to, clazz_key, :class_name => clazz_name)
      when :embed_one
        raise "EmbedOne is currently not supported by the Active Record adapter. It will be soon..."
        #clazz.send(:embeds_many, role_model_key, :class_name => role_model_class_name)      
      end
    end

    # AR sets this up ont its own using DB Table info
    def configure_field strategy
    end
  end
end