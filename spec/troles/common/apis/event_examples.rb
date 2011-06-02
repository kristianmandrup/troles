shared_examples_for "Event API essentials" do
  describe 'Event API' do
    # Event API
    its(:event_manager) { should == Trole::EventManager }
    specify             { lambda { kris.field_changed? }.should raise_error } # since not using rails here!   
    specify             { kris.publish_change(:roles).should be_true }
    specify             { kris.update_roles.should be_false } # since not using rails   
  end
end
