module Troles::Mongoid
  class Config < Troles::Common::Config  
    
    def initialize clazz, options = {}
      super
    end

    # more likely, strategy should be part of configuration options directly when Config object is created!
    def configure_relation
      case strategy
      when :ref_many      
        has_many_for clazz, :role, :through => join_key 
        
        belongs_to_for join_model, :user
        belongs_to_for join_model, :role

        has_many_for role, :user, :through => join_key 
        
      when :embed_many
        embeds_many clazz, :role
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
      clazz.send(:field, role_field, type_opts(type)) if type      
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