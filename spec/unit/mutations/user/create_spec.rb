require 'spec_helper'

describe UserCreate do
  let(:action) do
    UserCreate.run({
      user: {
        name:     'Neil deGrasse Tyson',
        email:    'neiltyson',
        password: 'foobar'
      }
    })
  end

  it { action.success?.should be_true }
  it { action.result.should be_an_instance_of User }
  it { action.result.name.should eql 'Neil deGrasse Tyson' }
end
