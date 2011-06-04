shared_examples_for "Trole Read API" do

  subject { user }
    its(:role_name) { should == :user }
end