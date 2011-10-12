module Troles::Adapters::ActiveRecord
  class Config < Troles::Common::Config  

    attr_reader :models
    
    def initialize subject_class, options = {}
      super       
      puts "models classes: #{subject_class}, #{object_model}, #{join_model}"
      @models = ::Schemaker::Models.new(subject_class, object_model, join_model)
    end
    
    def configure_relation
      case strategy
      when :join_ref_many
        configure_join_model
      when :ref_many
        return configure_join_model if join_model?        
        subject.quick_join
      when :embed_many
        raise "Embed many configuration not yet implemented for ActiveRecord" 
      end
    end

    # AR sets this up ont its own using DB Table info
    def configure_field
    end
    
    protected

    def subject
      @subject ||= models.subject_model
    end

    def main_field
      role_field
    end      

    def join_model
      @join_model_found ||= begin
        find_first_class(@join_model, join_model_best_guess)
      end
    rescue ClassExt::ClassNotFoundError
      nil
    end

    def join_model?
      join_model
    end

    def join_model_best_guess
      "#{subject_class.to_s.pluralize}#{object_model.to_s.pluralize}"
    end

    def join_model= model_class
      @join_model = model_class and return if model_class.any_kind_of?(Class, String, Symbol)
      raise "The join model must be a Class, was: #{model_class}"
    end

    def join_key
      make_key join_model
    end
    
    def configure_join_model           
      if Troles::Common::Config.log_on?
        puts "configuring join model..." 
        puts "Subject class: #{subject_class}"
        puts "Role class: #{object_model}"
        puts "Join class: #{join_model}"
      end
            
      [:object, :subject, :join].each do |type|
        clazz = "Schemaker::#{type.to_s.camelize}Model".constantize
        clazz.new(model).configure
      end      
    end
  end
end