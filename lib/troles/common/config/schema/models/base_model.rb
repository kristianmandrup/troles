# 
# @author Kristian Mandrup
#
# Basic Model configuration functionality
# 
# Each type of model to be configured shares some common functionality and state, that is encapsulated here for reuse
#
module Troles::Common
  class Config
    module Schema
      class BaseModel

        attr_accessor :models, :my_class
        attr_reader :logs # can be used to later check which relationships were set up        

        # @param [Schema::Models] each model needs to have access to the collection of models it may need to create relations with
        # @param [Class] each model must have a reference to the Class it aims to configure!
        def initialize models, my_class
          raise ArgumentError, "The first argument must be a Schema::Models instance" if !models.is_a?(Troles::Common::Config::Schema::Models)
          raise ArgumentError, "The second argument must be the Class that is to be configured" if !my_class.is_a?(Class)

          @models   = models     
          @my_class = my_class 
          @logs = []         
        end

        # The models :subject and :object must both be configured 
        # with a has_many relationship to the join model which the has_many :through references
        def configure
          create_has_many :join
        end

        # The class name of the Class to be configured
        # @return [String] class name
        def clazz_name
          my_class.to_s
        end
        alias_method :my_class_name, :clazz_name

        def self.model_types
          [:object, :subject, :join]
        end

        # Generate convenience methods for: :object, :subject, :join
        # - object_model
        # - object_class
        # - object_class_name

        model_types.each do |model_type|
          class_eval %{
            def #{model_type}_model
              models.#{model_type}_model
            end

            def #{model_type}_class
              models.#{model_type}_class
            end

            def #{model_type}_class_name
              #{model_type}_class.clazz_name
            end            
          }
        end
        
        protected

        # Is global logging turned on 
        def log_on?
          Troles::Common::Config.log_on?
        end

        # Create a 'belongs_to' relationship on the model (Class)
        # Example:
        #   Role.belongs_to :user, :class_name => 'User'
        def create_belongs_to clazz, options = {}
          make_relationship :belongs_to, clazz, options
        end

        # Create a 'has_many' relationship on the model (Class)
        # Example:
        #   User.has_many :roles, :class_name => 'Role'
        def create_has_many clazz, options = {}
          make_relationship :has_many, clazz, options
        end        

        # Create a 'has_many :through' relationship on the model (Class)
        # Example:
        #   User.has_many :roles, :class_name => 'Role', :through => 'UsersRoles'
        def create_has_many_through clazz, options = {}
          create_has_many clazz, through_options(options)
        end

        # To setup symmetrical has_and_belongs_to_many relationship:
        #
        # Example:
        #
        #   class UserAccount < ActiveRecord::Base    
        #     has_and_belongs_to_many :troles, :class_name => 'Role'
        #   end
        #   
        #   class Role < ActiveRecord::Base    
        #     has_and_belongs_to_many :user_accounts, :class_name => 'User'
        #   end
        #
        def has_and_belongs_many to_clazz, options = {}
          make_relationship :has_and_belongs_to_many, to_clazz, options[:from]
          to_clazz.make_relationship :has_and_belongs_to_many, my_class, options[:to]
        end

        # Creates a given type of relationship
        # @param [Symbol] the type of relationship, fx :has_many
        # @param [Class, Symbol] the Class that is the object of the relationship, fx Role for a User.has_many relationship
        # @param [Hash] any extra relationship options, fx for a :through relationship, or to indicate :class_name etc.        
        def make_relationship relationship_name, clazz, options = {} 
          options.delete(:key)
          log "#{my_class_name}.#{relationship_name} :#{key(clazz)}, #{options.inspect}" if log_on?          
          my_class.send(relationship_name, key(clazz), options)
        end              

        # creates a key for a given type
        # @param type [Symbol] - either :object, :subject or :join
        def key type
          models.key type
        end                

        def get_class type
          models.get_class type          
        end

        # log the relationship being added
        # - to STDOUT via puts
        # - to a logs list
        def log msg
          puts msg
          logs << msg          
        end        

        # sets up the :source relationship option, typically for a has_many through relationship
        def source_option cls_name
          {:source => source(cls_name) }
        end

        # sets up the :class_name relationship option for a given class (model
        # @param [Class, String] the class to point to
        def class_name_option cls_name
          {:class_name => cls_name.to_s }
        end

        # sets up the :through relationship option, always points to the join model 
        def through_option 
          {:through => join_model.key }
        end

        # sets up the :foreign_key relationship option
        # the foreign key name should always correspond to 'my own' class name
        def foreign_key_option cls_name
          {:foreign_key => foreign_key(cls_name) }
        end

        # sets up the full :through relationship options
        # Example:
        #   :class_name => 'Role', :through => 'UsersRoles', :source => :role (, :foreign_key => :user_id)
        def through_options cls_name
          model = get_class(cls_name)
          through_option.merge(source_option model).merge(class_name_option model) #.merge(foreign_key_option class_name)
        end

        # creates the source
        # Role becomes :role
        def source cls_name
          cls_name.to_s.underscore.singularize
        end                        

        # creates the foreign key
        # RefManyAccount becomes :account_id
        def foreign_key cls_name
          name = cls_name.underscore.split('_').last.singularize
          :"#{name}_id"
        end                           
      end
    end
  end
end