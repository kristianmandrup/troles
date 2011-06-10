require 'spec_helper'

class Role < ActiveRecord::Base  
end

def object_model_class
  Troles::Common::Config::Schema::ObjectModel
end

describe object_model_class do
  let(:object_model) do
    join_model_class.new models, 'Role'
  end
  
  describe '#configure' do
    object_model.configure
  end
end