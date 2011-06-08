module TroleGroups
  class Config
    module ValidRoleGroups    
      def add_valid_rolegroups *rolegroups
        valid_rolegroups =valid_rolegroups & rolegroups
      end

      def valid_rolegroups= *rolegroups
        vrs = rolegroups.flatten.map{|r| r.to_s.alpha_numeric}.map(&:to_sym).uniq
        raise ArgumentError, "The #{strategy} strategy can only accept 2 valid rolegroups" if (vrs.size > 2) && strategy == :bit_one
        raise ArgumentError, "The rolegroup names you want to be valid are not valid rolegroup names. Must be alphanumeric, was: #{rolegroups.flatten}" if vrs.empty?
        @valid_rolegroups ||= vrs
      end

      def valid_rolegroups
        raise "No valid rolegroups defined" if !@valid_rolegroups || @valid_rolegroups.empty?
        @valid_rolegroups      
      end
    end
  end
end