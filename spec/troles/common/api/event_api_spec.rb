shared_examples_for "Common Event API" do
  # Event API
  subject { user }
    its(:event_manager) { should == Troles::Common::EventManager }

  specify             { user.role_field_changed?(:roles).should be_false } # using dummy method on User
  specify             { user.publish_change(:roles).should be_true }
  specify             { user.update_roles.should be_false } # ?
end
