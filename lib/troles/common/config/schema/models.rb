# 
# @author Kristian Mandrup
#
# Model configuration
# Has responsibiloity to configure relationships between all models
# A single behavior decoration can have up to three acting models in a joined relationship

# The subject model: 
# - is the model which is the subject of the behavior added.
# - it has the main field, which CAN be a relationship to the object model, either directly or via a join model (fx in Relational DBs)
# 
# The object model: 
# - is the object of interest to the subject, fx a Role model is the object of interest for a UserAccount (subject)
# - the object can be referenced directly, via a join model or embedded under the subject
#
# The join model: 
# - is used to bind object to subject in a Many-to-Many relationship, typically for Relational DBs
# - it must have a foreign key for both object and subject model, and most often no primary key of its own

module Troles::Common
  class Config
    module Schema
      class Models
        attr_accessor :subject_model, :object_model, :join_model

        # Sets up the models that take part in the model relationship to be configured
        # @param subject_class [Class]
        # @param object_class [Class]
        # @param join_class [Class]        
        # @param options [Hash] - contains the key to be used for the main field (subject key) and possibly other options to configure the models more precisely as needed 
        def initialize subject_class, object_class, join_class, options = {}
          @subject_model  = SubjectModel.new self, subject_class, options[:subject_key]
          @object_model   = ObjectModel.new self, object_class
          @join_model     = JoinModel.new self, join_class
        end

        # creates a key for a given type
        # @param type [Symbol] - either :object, :subject or :join
        def key type
          make_key get_class(type)
        end                

        # configure each model in turn
        def configure
          [subject_model, object_model, join_model].each do
            |model| model.configure
          end  
        end

        def logs
          @logs ||= [subject_model, object_model, join_model].inject([]) do |res, model|
            res << model.logs
            res
          end.flatten
        end

        def self.model_types
          [:object, :subject, :join]
        end

        # generate methods:
        # - object_class
        # - subject_class
        # - join_class
        model_types.each do |model_type|
          class_eval %{
            def #{model_type}_class
              #{model_type}_model.clazz_name              
            end
          }
        end
                                   
        # retrieves a given Class ie. a type of model
        # @param [Class, String, Symbol, BaseModel] which class to get
        # @return [Class] the Class (model) of interest
        def get_class type
          case type
          when Class
            type
          when BaseModel
            type.my_class
          when String, Symbol
            return get_class send("#{type}_model") if [:subject, :object, :join].include?(type.to_sym)
            type.to_s.constantize
          else
            raise "Can't determine a class from: #{type}"
          end          
        end

        # creates a key from a class name
        # fx UsersRoles becomes :user_roles, where only the last part is pluralised! 
        # @param [String] the class name
        def make_key class_name
          name = class_name.to_s.pluralize.gsub(/::/, '__').underscore
          only_last_part_plural(name).to_sym
        end                               

        protected

        # Takes a composite name and makes a nice sounding key that follows the Rails conventions
        # fx UsersRoles becomes :user_roles, where only the last part is pluralised!
        # @param [String] the class name, fx UsersRoles
        def only_last_part_plural cls_name 
          parts = cls_name.split('_')
          name = parts.inject([]) do |res, part|
            res << (part != parts.last ? part.singularize : part)
            res
          end.join('_')          
        end                
      end
    end
  end
end
