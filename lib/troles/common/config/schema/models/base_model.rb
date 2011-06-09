module Troles::Common
  class Config
    module Schema
      class BaseModel

        attr_accessor :models, :my_class
        
        def initialize models, my_class
          @models   = models     
          @my_class = my_class          
        end
        
        protected

        def class_name
          my_class.to_s
        end
        alias_method :my_class_name, :class_name

        def self.model_types
          [:object, :subject, :join]
        end

        model_types.each do |model_type|
          class_eval %{
            def #{model_type}_class
              models.object_class
            end

            def #{model_type}_class_name
              #{model_type}_class.class_name
            end            
          }
        end

        # Role.belongs_to :user, :class_name => 'User'
        def create_belongs_to clazz, options = {}
          make_relationship :belongs_to, clazz, options
        end

        def create_has_many clazz, options = {}
          make_relationship :has_many, clazz, options
        end        

        def create_has_many_through clazz, options = {}
          create_has_many clazz, through_options(options)
        end

        # To setup sth like this:
        #
        # class UserAccount < ActiveRecord::Base    
        #   has_and_belongs_to_many :troles, :class_name => 'Role'
        # end
        # 
        # class Role < ActiveRecord::Base    
        #   has_and_belongs_to_many :user_accounts, :class_name => 'User'
        # end
        def has_and_belongs_many to_clazz, options = {}
          make_relationship :has_and_belongs_to_many, to_clazz, options[:from]
          to_clazz.make_relationship :has_and_belongs_to_many, my_class, options[:to]
        end

        def make_relationship rel_name, clazz, options = {}
          puts "#{my_class_name}.#{rel_name} :#{key(clazz)}, #{options.inspect}" if log_on?          
          my_class.send(rel_name, key(clazz), options)
        end              
        
        def key type
          model.key type
        end                
            
        def source_option class_name
          {:source => source class_name}
        end

        def class_name_option class_name
          {:class_name => class_name.to_s}
        end

        def through_option 
          {:through => join_class.key)}
        end

        def foreign_key_option class_name
          {:foreign_key => foreign_key(class_name)}
        end

        def through_options class_name
          {through_option, source(class_name), class_name_option(class_name) }
        end

        # Role becomes :role
        def source class_name          
          class_name.to_s.underscore.singularize
        end                        

        # RefManyAccount becomes :account_id
        def foreign_key class_name          
          name = class_name.underscore.split('_').last.singularize
          :"#{name}_id"
        end                           
      end
    end
  end
end