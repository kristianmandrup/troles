module Trole::ActiveRecord
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
        raise "Embed one is not yet implemented for Active Record. Please add support using #serialize, to store the field as YAML"
      end
    end

    # AR sets this up ont its own using DB Table info    
    def configure_field
    end       
  end
end