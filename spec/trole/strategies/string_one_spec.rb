require 'trole_spec'
User.valid_roles = [:user, :admin, :editor]

describe Trole::Strategy::StringOne do
  let(:kris)      { Factory.create :user, :trole => 'user' } # set to :user
  let(:susan)     { Factory.create :user, :trole => 'admin' } # set to :admin
  
  it_should_behave_like "a Many strategy for Kris"
  it_should_behave_like "a Many strategy for Susan"
