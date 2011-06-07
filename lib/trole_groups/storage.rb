module TroleGroups
  module Storage
    autoload :BaseMany,   'trole_groups/storage/base_many'
    # autoload :BitMany,    'trole_groups/storage/bit_many'
    autoload :EmbedMany,  'trole_groups/storage/embed_many'
    autoload :RefMany,    'trole_groups/storage/ref_many'
    # autoload :StringMany, 'trole_groups/storage/string_many'        
    
    class BaseMany < Troles::Common::Storage
      protected
      
      # get matching list of Role instances
      # @param  [Array<Symbol>] list of role names to find Roles for
      # @return [Array<Role>] references to Role instances
      def find_rolegroups *rolegroups
        rolegroup_model.where(:name => rolegroups.flatten).all
      end

      # get list of embedded Role instances
      # @param  [Array<Symbol>] list of role names
      # @return [Array<Role>] Role instances generated      
      def rolegroups_to_embed *rolegroups
        raise "Must be implemented by embed storage to generate a set of rolegroups to embed"
      end           
    end        
  end
end