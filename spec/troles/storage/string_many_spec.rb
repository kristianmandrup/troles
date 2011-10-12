def migrate_up
  migrate :string_many
end

require 'active_record_helper'
require 'troles_spec'

User.troles_strategy :string_many
User.valid_roles = [:user, :admin, :blogger]

describe Troles::Storage::StringMany do
  let(:kris)    { Factory.create :user, :troles => 'user' }
  subject 		{ Troles::Storage::StringMany.new kris }

  it 'should set roles' do 
  	subject.set_roles 'blogger', 'admin'
  	subject.display_roles.should == [:blogger, :admin]
  end
end
