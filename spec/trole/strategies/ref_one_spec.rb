require 'trole_spec'
User.valid_roles = [:user, :admin, :editor]

# make available! (perhaps should be auto-done by User.valid_roles for this strategy!)
Role.create(:name => :user)
Role.create(:name => :admin)
Role.create(:name => :editor)

describe Trole::Strategy::RefOne do
  let(:kris)    { Factory.create :user, :trole => [Role.where(:name => :user)] } # set to :user
  let(:susan)    { Factory.create :user, :trole => [Role.where(:name => :admin)] } # set to :admin
  
  it_should_behave_like "a Many strategy for Kris"
  it_should_behave_like "a Many strategy for Susan"
