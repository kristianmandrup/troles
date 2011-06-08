# @author Kristian Mandrup
#
# Troles base storage for Many roles strategies
#
module TroleGroups
  module Storage
    class BaseMany
      attr_reader :rolegroup_subject

      # initializes storage with reference to role subject
      # @param [Object] the role subject (fx a User or UserAccount) 
      def initialize rolegroup_subject
        @rolegroup_subject = rolegroup_subject
      end      

      # valid roles of the role subjects class (fx account - i.e the account rules!)
      # @return [Array<Symbol>] the list of valid roles
      def valid_roles
        rolegroup_subject.class.valid_roles
      end        

      # name/type of storage
      # @return [Symbol]
      def name
        :generic
      end 

      # sets the value of the role field (@trole or @troles) and persists the value (in the data store)
      # @param [Object] the value to set on the role field of the role subject
      def set_ds_field value
        return if ds_field_value == value 
        if Troles::Common::Config.log_on?
          puts "TroleGroups::Storage::BaseMany.set_ds_field:"
          puts "#{rolegroup_subject}.#{ds_field_name} = #{value}"
        end
        rolegroup_subject.send(:"#{ds_field_name}=", value)
        persist_role_changes!
      end

      # the name of the role field
      # @return [Symbol] the name
      def ds_field_name
        rolegroup_field
      end

      # the current value of the role field
      # @return [Object] the value
      def ds_field_value
        # puts "#{rolegroup_subject}.#{ds_field_name}" if Troles::Common::Config.log_on?
        rolegroup_subject.send(ds_field_name)
      end      

      # Attempts to persist the role field changes
      # @return [true, false, error] true if saved, false if no save! method, Error on some error
      def persist_role_changes!  
        return false if !rolegroup_subject.respond_to? :save
        rolegroup_subject.save
        rolegroup_subject.publish_change :role_groups
      end 

      protected

      def trolegroups_config
        rolegroup_subject.class.trolegroups_config
      end

      def rolegroup_field      
        trolegroups_config.rolegroup_field
      end

      def rolegroup_model
        trolegroups_config.rolegroup_model
      end

      def rolegroup_list
        rolegroup_subject.rolegroup_list
      end

      def role_list
        rolegroup_subject.role_list
      end
            
      # get matching list of Role instances
      # @param  [Array<Symbol>] list of role names to find Roles for
      # @return [Array<Role>] references to Role instances
      def find_rolegroups *names
        rolegroup_model.where(:name => names.flatten).all
      end

      # get list of embedded Role instances
      # @param  [Array<Symbol>] list of role names
      # @return [Array<Role>] Role instances generated      
      def rolegroups_to_embed *roles
        raise "Must be implemented by embed storage to generate a set of roles to embed"
      end           
    end        
  end
end