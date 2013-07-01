require 'spec_helper'

describe User do
  let(:user) { create :user }

  it { should validate_presence_of :uid }
  it { should validate_presence_of :provider }
  it { should validate_presence_of :email }

  it { user.should be_valid }

  describe '.omniauth!' do
    let(:omniauth) do
      User.omniauth!(
        {
          'uid'      => 'foobar',
          'provider' => 'google_oauth2',
          'info'     => {
            'email' => 'foo@bar.com'
          }
        }
      )
    end

    it { omniauth.should be_valid }
    it { omniauth.uid.should eql 'foobar' }
    it { omniauth.provider.should eql 'google_oauth2' }
    it { omniauth.email.should eql 'foo@bar.com' }
  end

  describe '#generate_access_token!' do
    it { user.access_token.should_not be_nil }
  end
end
