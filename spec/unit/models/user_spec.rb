require 'spec_helper'

describe User do
  let(:user) { create :user }

  it { should validate_presence_of :email }

  it { user.should be_valid }

  describe '.authenticate' do
    let(:action) do
      User.authenticate(user.email, 'foobar')
    end

    it { action.should be_an_instance_of User }
    it { action.should eql user }
  end

  describe '#password' do
    it { user.password.should be_an_instance_of BCrypt::Password }
    it { user.password.should == 'foobar' }
  end

  describe '#password=' do
    before do
      user.password = 'barfoo'
      user.save
    end

    it { user.password.should == 'barfoo' }
  end
end
