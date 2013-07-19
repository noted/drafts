require 'spec_helper'

describe Note do
  let(:note) { create :note }
  let(:user) { note.user }

  it { should validate_presence_of :title }

  it { note.should be_valid }
end
