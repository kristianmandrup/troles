module Troles::ActiveRecord
  class Config < Troles::Common::Config  

    attr_accessor :role_join_model
    
    def initialize clazz, options = {}
      super
    end
    
    def configure_relation
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
    def configure_field
    end
  end
end