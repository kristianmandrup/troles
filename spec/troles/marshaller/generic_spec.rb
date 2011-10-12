def migrate_up
  migrate :string_many
end

require 'active_record_helper'
require 'troles_spec'

User.troles_strategy :string_many
User.valid_roles = [:user, :admin, :blogger]

describe Troles::Common::Marshaller::Generic do
  let(:kris)    { Factory.create :user, :troles => 4}
  let(:marshaller) { Troles::Common::Marshaller::Generic.new kris }  

  specify { marshaller.role_subject.should == kris }    
  specify { marshaller.valid_roles.should == [:user, :admin, :blogger] }
end