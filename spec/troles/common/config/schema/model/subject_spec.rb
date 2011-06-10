require 'troles/common/config/schema/models_helper'

def subject_model_class
  Troles::Common::Config::Schema::SubjectModel
end

describe subject_model_class do
  let(:subject_model) do
    subject_model_class.new models, 'UserAccount'
  end
  
  describe '#configure' do
    it 'should configure subject model' do
      subject_model.configure
    end        
  end
end