require 'spec_helper'

describe UserUpdate do
  let(:user) { create :user }
  let(:action) do
    UserUpdate.run({
      current_user: user,
      user: {
        id: user.id.to_s,
        name: 'Carl Sagan',
        email: user.email
      }
    })
  end

  it { action.success?.should be_true }
  it { action.result.should be_an_instance_of User }
  it { action.result.name.should eql 'Carl Sagan' }
end
