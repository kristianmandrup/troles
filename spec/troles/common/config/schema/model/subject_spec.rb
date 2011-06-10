require 'spec_helper'

class UserAccount < ActiveRecord::Base  
end

def subject_model_class
  Troles::Common::Config::Schema::SubjectModel
end

describe subject_model_class do
  let(:subject_model) do
    join_model_class.new models, 'UserAccount'
  end
  
  describe '#configure' do
    subject_model.configure
  end
end