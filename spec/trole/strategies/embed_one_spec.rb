require 'trole_spec'
User.valid_roles = [:user, :admin, :editor]

describe Trole::Strategy::EmbedOne do
  let(:kris)    { Factory.create :user, :trole => [Role.create :user] } # set to :user
  let(:susan)    { Factory.create :user, :trole => [Role.create :admin] } # set to :admin
  
  it_should_behave_like "a Many strategy for Kris"
  it_should_behave_like "a Many strategy for Susan"

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