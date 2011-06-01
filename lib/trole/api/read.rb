module Trole::Api
  module Read
    module Shared      
      # perform any? on role_list
      def has_role? role
        role_list.include? role.to_sym
      end

      # role_list has one element which is role
      def is_role? role
        role_list.first == role.to_sym && role_list.size == 1
      end

      # the role as a Symbol
      def first_role
        role_list.first      
      end
      alias_method :role_name, :first_role
    
      # return Set of symbols,where each symbol is a role name
      # This set should be cached and only invalidated when the user has a change of roles
      def role_list        
        @role_list ||= begin
          strategy.display_roles
        end # || Set.new
      end    
    end    
    include Shared
  end
end