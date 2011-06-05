class User < ActiveRecord::Base
  def role_value
    [:troles, :trole].each do |name|
      return send(name) if respond_to? name
    end
    nil
  end    
end
