shared_examples_for "Trole Core API" do
  subject { User }
    its(:role_field) { should == :trole }  
end