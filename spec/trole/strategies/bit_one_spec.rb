require 'trole_spec'

STRATEGY = :bit_one

require 'trole/models'

describe Trole::Strategy::BitOne do
  let(:user) { User.new }
  subject { user }
    its(:role_field)  { should == :trole }
    its(:role)        { should be_a Trole::Operations }
    its(:role_name)   { should == :admin }

    specify { user.role_list.should == [:admin] }
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