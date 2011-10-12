def migrate_up
  migrate :bit_many
end

require 'active_record_helper'
require 'troles_spec'

User.troles_strategy :bit_many do |c|
	c.valid_roles = [:user, :admin, :blogger]
end.configure!

describe Troles::Storage::BitMany do
  let(:kris)    { Factory.create :user, :troles => 4}
  subject 		{ Troles::Storage::BitMany.new kris }

  it 'should set roles' do 
  	subject.set_roles 'blogger'
  	subject.display_roles.should == [:blogger]
  end
end
