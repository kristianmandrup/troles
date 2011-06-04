module Troles::Mongoid
  class Config < Troles::Common::Config  
    
    def initialize clazz, options = {}
      super     
    end

    def generic?
      false
    end
    
    # more likely, strategy should be part of configuration options directly when Config object is created!
    def configure_relation
      case strategy
      when :ref_many
        clazz.send(:has_many, role_model_key, :class_name => role_model_class_name)
        role_model.send(:belongs_to, clazz_key, :class_name => clazz_name)
      when :embed_one
        clazz.send(:embeds_many, role_model_key, :class_name => role_model_class_name)      
      end
    end
    
    def configure_field
      type = case strategy
      when :bit_many
        Integer
      when :string_many
       String
      end
      clazz.send(:field, role_field, type) if type      
    end
  end
end