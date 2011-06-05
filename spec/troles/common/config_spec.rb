shared_examples_for "Troles Common Config" do
  describe 'config settings' do
    describe '#default_orm' do
      before :each do        
        user.troles_config.orm.should == nil
        Troles.Config.default_orm = :mongoid                
        user.troles_config.orm.should == :mongoid
      end
    end
  end
end