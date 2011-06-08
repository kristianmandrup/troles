module Troles::Mongoid
  class Config < Troles::Common::Config  
    
    def initialize subject_class, options = {}
      super
    end

    # more likely, strategy should be part of configuration options directly when Config object is created!
    def configure_relation
      case strategy
      when :ref_many      
        has_many_for subject_class, :role, :through => join_key 
        
        belongs_to_for join_model, subject_class
        belongs_to_for join_model, object_model

        has_many_for role, subject_class, :through => join_key 
        
      when :embed_many
        embeds_many subject_class, object_model
      end
    end
    
    def configure_field
      type = case strategy
      when :bit_many
        Integer
      when :string_many
        String
      end
      # field :name, :type => String       
      subject_class.send(:field, role_field, type_opts(type)) if type      
    end     
    
    def type_opts type
      { :type => type }
    end
    
    protected
    
    def embeds_many from, to
      make_relationship :embeds_many, from, to
    end    
  end
end