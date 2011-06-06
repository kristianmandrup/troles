module Trole::Mongoid
  class Config < Troles::Common::Config  
    
    def initialize clazz, options = {}
      super
    end
    
    def configure_relation
      case strategy
      when :ref_one
        has_one_for clazz, :role
        belongs_to_for role_model, :user
      when :embed_one
        embeds_one clazz, :role
      end
    end
    
    def configure_field
      type = case strategy
      when :bit_one
        Boolean
      when :string_one
        String
      end
      clazz.send(:field, role_field, type) if type      
    end   
    
    protected
    
    def embeds_one from, to
      make_relationship :embeds_one, from, to
    end        
  end
end