require 'dummy_spec_helper'

describe "Troles strategies" do
  include Capybara
  
  def user_setup
    RefManyUser.destroy_all
    @user1 = RefManyUser.create(:name => "Kris")
    @user2 = RefManyUser.create(:name => "Stanislaw")
    @user3 = RefManyUser.create(:name => "Miloviza")
  end
  
  def role_setup
    Role.destroy_all
    Role.create(:name => "user")
    Role.create(:name => "admin")
    Role.create(:name => "blogger")
    Role.create(:name => "editor")
  end

  before(:all) do
    user_setup
    role_setup
  end

  it "should be a valid app" do
    ::Rails.application.should be_a(Dummy::Application)
  end

  it "setup should be right" do
    RefManyUser.all.size.should == 3
    Role.all.size.should == 4
  end

  it "should render root page" do
    get root_path
    response.status.should == 200
  end

  describe "RefMany Strategy" do
    it "should render user's name" do
      get root_path
      #puts response.body
      response.body.should match(/Kris/)
      response.body.should match(/Stanislaw/)      
    end
  end

end