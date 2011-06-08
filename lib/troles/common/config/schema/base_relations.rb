module Troles::Common
  class Config
    module Schema
      class BaseRelations

        # the Schema model
        attr_accessor :model

        def initialize model
          @model = model
        end

        def class_name
          model.to_s
        end

        def subject_class
          model.subject_class
        end

        def join_class
          model.join_class
        end

        def object_class
          model.object_class
        end

        def key options = {}
          make_key class_name, options
        end        
        
        def belongs_to_for from, to, options = {}
          make_relationship :belongs_to, from, to, options
        end

        def has_many_for from, to, options = {}
          make_relationship :has_many, from, to, options
        end

        def has_one_for from, to, options = {}
          make_relationship :has_one, from, to, options
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
        def has_and_belongs_many from, to, options = {}
          make_relationship :has_and_belongs_to_many, from, to, :key => role_field
          make_relationship :has_and_belongs_to_many, to, from, options
        end


        # options: 
        # - :opts, extras options, fx to set the :through relationship
        # - :key (usually to enforce use of role_field as key name)      
        def make_relationship type, from, to, options = {}
          # puts "type: #{type}, #{from}, #{to}"
          from_type = get_model_type from
          to_type = get_model_type to

          key_opts = key_options(type, to_type)

          model_key = options[:key] ? options[:key] : send("#{to_type}_key", key_opts)

          class_name = send "#{to_type}_class_name"

          rel_options = {:class_name => class_name}   

          rel_options.merge!(options[:opts]) if options[:opts]

          puts "#{from}.#{type} :#{model_key}, #{rel_options.inspect}" if log_on?
          
          from.send(type, model_key, rel_options)
        end 
        
        def make_key name, options = {}
          name = name.to_s.gsub(/::/, '__').underscore.pluralize
          parts = name.split('_')
          name = parts.inject([]) do |res, part|
            res << (part != parts.last ? part.singularize : part)
            res
          end.join('_')
          
          key = name
        end               
      end
    end
  end
end