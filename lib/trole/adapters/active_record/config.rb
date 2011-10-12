module Trole::Adapters::ActiveRecord
  class Config < Troles::Common::Config  
    
    def initialize subject_class, options = {}
      super
      puts "models classes: #{subject_class}, #{object_model}"
      @models = ::Schemaker::Models.new(subject_class, object_model, nil)
    end
    
    def configure_relation
      case strategy
      when :ref_one        
        obj_model.create_belongs_to subject_class, :key => main_field 
        subj_model.create_has_one object_model
      when :embed_one
        raise "EmbedOne is currently not supported by the Active Record adapter. It will be soon..."
        #clazz.send(:embeds_one, role_model_key, :class_name => role_model_class_name)      
      end
    end
    
    def obj_model
      models.object_model
    end

    def subj_model
      models.subject_model
    end

    def main_field
      role_field
    end      

    # AR sets this up on its own using DB Table info    
    def configure_field
    end       
  end
end