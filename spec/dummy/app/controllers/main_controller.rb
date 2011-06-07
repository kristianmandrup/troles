class MainController < ApplicationController

  def index
    @users = RefManyUser.all
    
    first_user = @users.first

    # puts "Clearing roles of first user"
    first_user.clear_roles!

    # puts "Adding role admin to first user"
    first_user.roles << :admin    
        
    # puts "#{first_user.name} has role :admin? #{first_user.has_role? :admin}"
  end
end