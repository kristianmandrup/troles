require 'dummy_spec_helper'

describe "Troles strategies" do
  include Capybara
  
  def user_setup
    @user1 = RefmanyUser.create(:name => "Kris")
    @user2 = RefmanyUser.create(:name => "Stanislaw")
    @user3 = RefmanyUser.create(:name => "Miloviza")
  end
  
  def role_setup
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
    RefmanyUser.all.size.should == 3
    Role.all.size.should == 4
  end

  it "should render root page" do
    get root_path
    response.status.should == 200
  end

  describe "Refmany Strategy" do
    describe "ActiveRecord" do
      it "should read user records" do
        @user1.roles.list.should be_empty
      end
    end

    it "should render user's name" do
      get troles_refmany_path
      #puts response.body
      response.body.should match(/Kris/)
    end
  end

end