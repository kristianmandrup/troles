require 'trole_spec'
User.role_strategy :bit_one

User.valid_roles = [:user, :editor] # override default [:user, :admin]

describe Trole::Strategy::BitOne do
  let(:kris)    { Factory.create :user, :trole => false } # set to :user
  let(:susan)    { Factory.create :user, :trole => true } # set to :admin
  
  it_should_behave_like "Using a :single role strategy for Kris"
  # it_should_behave_like "Using a :single role strategy for Susan"
    
    # 
    # its(:role)        { should be_a Trole::Operations }
    # its(:role_name)   { should == :admin }
    # 
    # its(:role_list)   { should == [:admin] }
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