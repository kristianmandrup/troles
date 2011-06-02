require 'troles_spec'
User.troles_strategy :bit_many
User.valid_roles = [:user, :admin, :blogger]

describe Troles::Strategy::BitMany do
  let(:kris)    { Factory.create :user, :troles => 1 } # :user role
  let(:susan)   { Factory.create :user, :name => 'susan', :troles => 2 } # :admin role
  let(:jack)    { Factory.create :user, :name => 'jack', :troles => 3 } # :user and :admin roles

  it_should_behave_like "a Many strategy for Kris"

  it_should_behave_like "a Many strategy for Susan"
  it_should_behave_like "a Many strategy for Jack"
    
  # subject { kris }  
  #   # Core API
  #   specify       { lambda { kris.role_field }.should raise_error } # is a class method    
  #   specify       { User.role_field.should == :troles }
  # 
  #   its(:roles)         { should be_a Troles::Operations }
  #   its(:role_list)     { should include(:user) }

    # specify       { lambda { kris.static_roles? }.should raise_error } # is a class method    
    # specify       { kris.static_roles?.should be_false }
    # specify       { User.static_roles?.should be_false }
  # 
  #   # Event API
  #   its(:event_manager?)  { should be_a Troles::EventManager }    
  #   its(:update_roles?)   { should raise_error }    
  #   its(:field_changed?)  { should raise_error }    
  # 
  #   specify { kris.publish_change!(:roles).should_not raise_error }
  # 
  #   # Read API
  #   specify { kris.has_role?(:user).should be_true }
  #   specify { kris.has_role?(:admin).should be_false }
  # 
  #   specify { kris.is_role?(:user).should be_true }
  #   specify { kris.is_role?(:admin).should be_false }
  # 
  # subject { susan }
  #   its(:role_list) { should include(:user, :blogger) }    
  #   its(:role_name) { should == :user }    
  # 
  #   specify { susan.is_role?(:user).should be_false }

    # specify { user.role_list.should == [:admin, :blogger] }
  # it { should be_valid }            
  # its(:errors) { should be_empty }
  # ################################################################################
  # # specify (generated descriptions)
  # # instead of repeating expectation with: it "should not be published"...)
  # specify { blog_post.should_not be_published }
  # 
  # ################################################################################
  # # subject (delegate should/should_not to subject)
  # subject { BlogPost.new :title => 'foo', :body => 'bar' }
  #  it "sets published timestamp" do
  #    subject.publish!
  #    subject.should be_published
  #  end
  # 
  # it { should be_valid }
  # its(:errors) { should be_empty }
  # its(:title) { should == 'foo' }


end