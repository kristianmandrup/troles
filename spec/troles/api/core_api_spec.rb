shared_examples_for "Troles Core API" do
  subject { User }
    its(:role_field) { should == :troles }
end