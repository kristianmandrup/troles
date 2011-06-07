require_all File.dirname(__FILE__) + '/api'

require 'trole/two_roles_spec'
require 'trole/multi_roles_spec'

shared_examples_for "Trole API" do
  include UserSetup 
     
  it_behaves_like "Trole Core API" do
    define_users
  end  

  it_behaves_like "Trole Cache API" do
    define_users
  end  

  it_behaves_like "Trole Event API" do
    define_users
  end  

  it_behaves_like "Trole Read API" do
    define_users
  end  

  it_behaves_like "Trole Validation API" do
    define_users
  end  

  it_behaves_like "Trole Write API" do
    define_users  
  end  
end  

# All strategies EXCEPT :bit_one strategy

shared_examples_for "Trole API for multiple roles" do
  include UserSetup 
    
  it_behaves_like "Trole Write API for multiple roles" do
    define_users
  end  
  
  it_behaves_like "Trole Operations API for multiple roles" do
    define_users
  end  
end

# Specs for :bit_one strategy

shared_examples_for "Trole API for two roles :bit_one" do
  include UserSetup 
    
  it_behaves_like "Trole Write API for two roles :bit_one" do
    define_users
  end  
  
  it_behaves_like "Trole Operations API for two roles :bit_one" do
    define_users
  end  
end
