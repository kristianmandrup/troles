module Troles::Common
  class Config
    module Schema
      class Models
        attr_accessor :subject_model, :object_model, :join_model
        
        def initialize subject_class, object_class, join_class, options = {}
          @subject_model  = SubjectModel.new self, subject_class, options[:subject_key]
          @object_model   = ObjectModel.new self, object_class
          @join_model     = JoinModel.new self, join_class          
        end
        
        def key type
          make_key get_class(type)
          class_key 
        end                
        
        def configure
          [subject_model, object_model, join_model].each {|model| model.configure}          
        end
                                   
        protected
        
        def get_class type
          case type
          when Class
            type
          when BaseModel
            type.my_class
          when String, Symbol
            raise "Not a valid type, #{type}" unless [:subject, :object, :join].include? type.to_sym        
            get_class send("#{type}_model")
          else
            raise "Can't determine a class from: #{type}"
          end          
        end
        
        def make_key class_name, options = {}
          name = class_name.to_s.pluralize.gsub(/::/, '__').underscore
          only_last_part_plural(name)
        end                               

        private
        
        def only_last_part_plural name 
          parts = class_name.split('_')
          name = parts.inject([]) do |res, part|
            res << (part != parts.last ? part.singularize : part)
            res
          end.join('_')          
        end                
      end
    end
  end
end
