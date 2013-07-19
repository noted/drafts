require 'spec_helper'

describe User do
  let(:user) { create :user }

  it { should validate_presence_of :email }

  it { user.should be_valid }

  describe '#generate_access_token!' do
    it { user.access_token.should_not be_nil }
  end
end
