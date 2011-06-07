class MainController < ApplicationController

  def index
    @refmany_user = RefManyUser.first
    @refmany_user.roles << :admin
    puts @refmany_user.inspect    
  end
end