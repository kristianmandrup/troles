module Trole::ActiveRecord
  class Config < Troles::Common::Config  
    
    def initialize subject_class, options = {}
      super
    end
    
    def configure_relation
      case strategy
      when :ref_one
        belongs_to_for subject_class, object_model, :key => main_field 
        has_many_for object_model, subject_class
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