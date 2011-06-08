module Trole::Mongoid
  class Config < Troles::Common::Config  
    
    def initialize subject_class, options = {}
      super
    end
    
    def configure_relation
      case strategy
      when :ref_one
        has_one_for subject_class, object_model
        belongs_to_for object_model, subject_class
      when :embed_one
        embeds_one subject_class, object_model
      end
    end
    
    def configure_field
      type = case strategy
      when :bit_one
        Boolean
      when :string_one
        String
      end
      subject_class.send(:field, role_field, type) if type      
    end   
    
    protected
    
    def embeds_one from, to
      make_relationship :embeds_one, from, to
    end        
  end
end