require 'troles/common/config/schema/models_helper'

def object_model_class
  Troles::Common::Config::Schema::ObjectModel
end

describe object_model_class do
  let(:object_model) do
    join_model_class.new models, 'Role'
  end
  
  describe '#configure' do
    it 'should configure object model' do
      object_model.configure
    end        
  end
end