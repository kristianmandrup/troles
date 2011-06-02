shared_examples_for "Cache API essentials" do
  describe 'Cache API' do
    describe '#invalidate_role_cache!' do
      it "should invalidate role cache, forcing update of @role_list instance var" do
        kris.role_list
        kris.invalidate_role_cache!                               
        expect { kris.role_list }.to change { kris.instance_variable_get "@role_list" }
      end
    end
  end
end