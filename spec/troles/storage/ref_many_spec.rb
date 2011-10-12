def migrate_up
  migrate :ref_many
end

require 'active_record_helper'
require 'troles_spec'

User.troles_strategy :ref_many do |c|
	c.valid_roles = [:user, :admin, :blogger]
end.configure!

describe Troles::Storage::RefMany do
  let(:kris)    { Factory.create :user }
  subject 		{ Troles::Storage::RefMany.new kris }

  it 'should set roles' do 
  	subject.set_roles 'blogger', 'admin'
  	subject.display_roles.should == [:blogger, :admin]
  end
end
